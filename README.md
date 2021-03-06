# Installation

Install zsh and set it to default shell:
```bash
$ chsh -s $(which zsh)
```

Clone this repository:
```bash
$ git clone https://github.com/Sinderella/dotfiles.git ~/.dotfiles
```

Install [rcm](https://github.com/thoughtbot/rcm#installation)

Install [vim-plug](https://github.com/junegunn/vim-plug#installation)

```bash
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install [zplug](https://github.com/zplug/zplug)
```bash
$ curl -sL zplug.sh/installer | zsh
```

Install the dotfiles:
```bash
$ env RCRC=$HOME/.dotfiles/rcrc rcup
```

Clone solarized dircolors
```bash
$ git clone https://github.com/seebi/dircolors-solarized
```

Please note that it only tested on linux.

Special thanks to https://thoughtbot.com/ for tools and snippets that are taken.

