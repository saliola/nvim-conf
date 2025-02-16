# nvim-conf

My config for neovim

## macos

Clone the repo to `~/.config/nvim` and install the following:
```
brew install nvim
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
sudo apt install tree-sitter-cli
sudo apt install nodejs
sudo apt install npm
sudo apt install python3-venv
```

I haven't looked into installing `stylua` yet.

## references

Some very nice references:
- a [video series](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn)
- a [video guide](https://www.youtube.com/watch?v=6pAG3BHurdM)
- [nvim config files](https://github.com/MariaSolOs/dotfiles/tree/mac)

## notes

- `]c` -- Next **c**hange (hunk)
- `]d` -- Go to next **d**iagnostic
- `]e` -- Move line down
- `]q` -- Next **q**uickfix entry
- `]s` -- Next mis**s**pelled word
- `]t` -- Next **t**odo comment

## tips and tricks

### Snacks.picker: grep only in specific files

To grep for "pattern" in tex files, say, use:
```
pattern -- -g=*.tex
```
or to search in multiple file extensions:
```
pattern -- -g={*.tex,*.log}
```
