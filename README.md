# nvim-conf

My config for neovim

## macos

Clone the repo to `~/.config/nvim` and install the following:
```
brew install fd
brew install ripgrep
brew install stylua
brew install texlab
```

## ubuntu

Clone the repo to `~/.config/nvim`.

Install the following with apt:
```
sudo apt install fd-find
sudo apt install ripgrep
```

Install `texlab` by downloading the precompiled binary:
```
https://github.com/latex-lsp/texlab/releases
```

Install `tree-sitter` by downloading the precompiled binary:
```
https://github.com/tree-sitter/tree-sitter/releases/
```
I haven't looked into installing `stylua` yet.


## references

I followed this [video series](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn)

## notes

### neo-tree

Some default keybindings

- `a` -- add a file / directory
- `H` -- toggle showing of hidden files
- `s` -- open file with | split
- `S` -- open file with - split
