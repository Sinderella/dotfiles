# Installation

Install zsh and set it to default shell:
  $ chsh -s $(which zsh)

Clone this repository:
  git clone TODO ~/.dotfiles

Install [rcm](https://github.com/thoughtbot/rcm#installation)

Install [zplug](https://github.com/zplug/zplug)
```console
$ curl -sL zplug.sh/installer | zsh
```

Install the dotfiles:
  env RCRC=$HOME/.dotfiles/rcrc rcup

Special thanks to https://thoughtbot.com/ for tools and snippets that are taken.
