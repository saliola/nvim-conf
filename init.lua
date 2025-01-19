require("config.lazy")

_G.dd = function(...)
    require('snacks').debug.inspect(...)
end
vim.print = _G.dd

require("config.options")
require("config.utils")
require("config.folding")
require("config.diagnostics")
require("config.keymaps")
require("config.autocmds")

require("extras.redir")
