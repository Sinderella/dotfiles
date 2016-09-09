# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# load plugins
[[ -f ~/.zplug/init.zsh ]] && [[ -f ~/.zsh.plug ]] && source ~/.zsh.plug

# set up the prompt
autoload -U colors && colors
export PS1="[%{$fg[red]%}%* - %D%{$reset_color%} %{$fg[blue]%}%n@%M%{$reset_color%}] %~
# "

autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=4000
SAVEHIST=4000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# preferences
bindkey -e

setopt COMPLETE_ALIASES

export EDITOR='vim'
export TERM=xterm-256color

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

