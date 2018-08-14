# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# load plugins
[[ -f ~/.zplug/init.zsh ]] && [[ -f ~/.zsh.plug ]] && source ~/.zsh.plug

SPACESHIP_DIR_COLOR='005fff'
SPACESHIP_CHAR_SUFFIX=' '

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
if which gdircolors > /dev/null 2>&1; then
  eval "$(gdircolors -b ~/.dircolors/dircolors.ansi-dark)"
elif which dircolors > /dev/null 2>&1; then
  eval "$(dircolors -b ~/.dircolors/dircolors.ansi-dark)"
fi
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

# https://github.com/solnic/dotfiles/blob/master/home/zsh/key-bindings.zsh
bindkey '^[[1;9D' backward-word # iterm
bindkey '^[^[[D' backward-word # tmux os x
bindkey '^[[1;3D' backward-word # tmux ubuntu

bindkey '^[[1;9C' forward-word # iterm
bindkey '^[^[[C' forward-word # tmux os x
bindkey '^[[1;3C' forward-word # tmux ubuntu


bindkey '^[[H' beginning-of-line # iterm
bindkey '^[[1~' beginning-of-line # tmux

bindkey '^[[F' end-of-line # iterm
bindkey '^[[4~' end-of-line # tmux

bindkey '^[[D' backward-word # putty
bindkey '^[[C' forward-word # putty

setopt COMPLETE_ALIASES

export EDITOR='nvim'
export TERM=xterm-256color

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=11"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
