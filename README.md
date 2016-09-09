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

Install [zplug](https://github.com/zplug/zplug)
```bash
$ curl -sL zplug.sh/installer | zsh
```

Install the dotfiles:
  env RCRC=$HOME/.dotfiles/rcrc rcup

Special thanks to https://thoughtbot.com/ for tools and snippets that are taken.
