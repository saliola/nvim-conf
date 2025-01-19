-- Source: https://gist.github.com/Leenuus/7a2ea47b88bfe16430b42e4e48122718
--
-- I just implemented a simple but really powerful user command suggested by
-- [romainl](https://gist.github.com/romainl) in lua, running
-- __asynchronously__ using `vim.uv` API.
--
-- In short, this is a command named `Redir`, which redirect `ex command` or
-- `shell commands` stdin/sterr to neovim buffers. So you can view them in
-- split window on the fly.
--
-- With `Redir`, you can do:
--
-- - A good way to inspect your neovim.
--
-- ```vim
-- " show all your messages in split, I love this one and make it default
-- Redir messages
-- " open in vertical split works too
-- vertical Redir messages
-- ```
--
-- - View external commands output:
--
-- Say you are working in a file named `a.js` with content:
--
-- ```js
-- let a = 'a'
-- console.log(1)
-- console.log(a)
--
-- console.log('hi visual line')
-- console.log('bye visual line')
-- ```
--
-- ```vim
-- " in line 2
-- " output: 1
-- .Redir !node
--
-- " anywhere in buffer
-- " output:
-- " 1
-- " a
-- %Redir !node
--
-- " marks works too, so you can visual select code block, and press `:`
-- " if you select line 5 and line 6
-- " output:
-- " hi visual line
-- " bye visual line
-- '<,'>Redir !node
-- ```
--
-- - Shell(`sh -c`) expansions works too:
--
-- ```vim
-- " display files in your cwd line by line
-- " <Bar> is not allowed, so it can be consumed by shell as pipe
-- Redir !echo ./* | tr ' ' '\n'
-- ```
--
-- - Async, so you can monitor a long running process's output without blocking vim.
--
-- ```vim
-- Redir !curl 'example.com/api/I-have-a-lot-to-say'
-- ```
--
-- - Add `bang` to see stderr in a split too.
--
--
-- Bonus:
--
-- ```vim
-- " Display messages in split
-- " Short as `M`
-- Messages
-- " Eval current line/file/range
-- " with interpreter specified in modeline
-- " if not
-- " prompt user for interpreter
-- EvalLine
-- EvalFile
-- EvalRange
-- ```
--
-- __Remove plenary log code yourself to get rid of annoying debug messages!__
--
-- Thanks @ramainl for inspiration
-- credit: https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7

vim.g.DEBUG = false
local log = require("plenary.log").new({
  plugin = "redir",
})

local function redir_open_win(buf, vertical, stderr_p)
  local wn = stderr_p and "redir_sterr_win" or "redir_win"
  if vim.g[wn] == nil then
    local win = vim.api.nvim_open_win(buf, true, {
      vertical = vertical,
    })
    vim.api.nvim_create_autocmd("WinClosed", {
      pattern = { string.format("%d", win) },
      callback = function()
        vim.g[wn] = nil
      end,
    })
    vim.g[wn] = win
  else
    vim.api.nvim_win_set_buf(vim.g[wn], buf)
  end
end

local function redir_vim_command(cmd, vertical)
  vim.cmd("redir => output")
  vim.cmd("silent " .. cmd)
  vim.cmd("redir END")
  local output = vim.fn.split(vim.g.output, "\n")
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, 0, false, output)

  redir_open_win(buf, vertical)
end

local function redir_shell_command(cmd, lines, vertical, stderr_p)
  local shell_cmd = {
    "sh",
    "-c",
    cmd,
  }

  local stdin = nil
  if #lines ~= 0 then
    stdin = lines
  end

  local stdout_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("ft", "redir_stdout", { buf = stdout_buf })
  redir_open_win(stdout_buf, vertical)

  local stderr = nil
  if stderr_p then
    local stderr_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value("ft", "redir_sterr", { buf = stderr_buf })
    redir_open_win(stderr_buf, vertical, true)
    stderr = function(err, data)
      vim.schedule_wrap(function()
        if data ~= nil then
          local output = vim.fn.split(data, "\n")
          if vim.g.DEBUG then
            log.info("stdout: " .. vim.inspect(output))
          end
          vim.api.nvim_buf_set_lines(stderr_buf, -1, -1, false, output)
        end
      end)()
    end
  end

  if vim.g.DEBUG then
    local report = string.format(
      [[lines: %s
stdin: %s
buf: %d
cmd_str: %s
shell_cmd: %s
]],
      vim.inspect(lines),
      vim.inspect(stdin),
      stdout_buf,
      cmd,
      vim.inspect(shell_cmd)
    )
    log.info(report)
  end

  vim.system(shell_cmd, {
    text = true,
    stdout = function(err, stdout)
      vim.schedule_wrap(function()
        if stdout ~= nil then
          local output = vim.fn.split(stdout, "\n")
          if vim.g.DEBUG then
            log.info("stdout: " .. vim.inspect(output))
          end
          vim.api.nvim_buf_set_lines(stdout_buf, -1, -1, false, output)
        end
      end)()
    end,
    stderr = stderr,
    stdin = stdin,
  }, function(completed)
    -- NOTE:
    -- placeholder to make call async
  end)
end

local function redir(args)
  local cmd = args.args
  local vertical = args.smods.vertical
  local stderr_p = args.bang

  if vim.g.DEBUG then
    log.info(vim.inspect(args))
  end

  if cmd:sub(1, 1) == "!" then
    local range = args.range
    local lines
    if range == 0 then
      lines = {}
    else
      local line1 = args.line1 - 1
      local line2 = args.line2
      line2 = line1 == line2 and line1 + 1 or line2
      lines = vim.api.nvim_buf_get_lines(0, line1, line2, false)
    end

    cmd = cmd:sub(2)
    redir_shell_command(cmd, lines, vertical, stderr_p)
  else
    redir_vim_command(cmd, vertical)
  end
end

vim.api.nvim_create_user_command("Redir", redir, {
  nargs = "+",
  complete = "command",
  range = true,
  bang = true,
})
vim.api.nvim_create_user_command("R", redir, {
  nargs = "+",
  complete = "command",
  range = true,
  bang = true,
})

vim.api.nvim_create_user_command("Mes", function()
  vim.cmd("Redir messages")
end, { bar = true })
vim.api.nvim_create_user_command("M", function()
  vim.cmd("Redir messages")
end, { bar = true })

local function evaler(range)
  return function(bang)
    local line = vim.fn.getline(1)
    local it = string.match(line, "^#!(.*)")

    local cmd = string.format("%sRedir%s !", range, bang and "!" or "")

    if it and it ~= "" then
      vim.cmd(cmd .. it)
    else
      vim.fn.feedkeys(":" .. cmd, "tn")
    end
  end
end

vim.api.nvim_create_user_command("EvalFile", function(args)
  local bang = args.bang
  evaler("%")(bang)
end, { bar = true, bang = true })

vim.api.nvim_create_user_command("EvalLine", function(args)
  local bang = args.bang
  evaler(".")(bang)
end, { bar = true, bang = true })

vim.api.nvim_create_user_command("EvalRange", function(args)
  local bang = args.bang
  evaler("'<,'>")(bang)
end, { bar = true, bang = true, range = true })