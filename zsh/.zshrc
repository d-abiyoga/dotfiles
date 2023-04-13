# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/spaceman/.oh-my-zsh"
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.script:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH=~/go/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	tmux
	zsh-autosuggestions
	zsh-syntax-highlighting
    zsh-z
    fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconf="vim ~/.zshrc"
alias vimconf="vim ~/.config/nvim/"
alias kittyconf="vim ~/.config/kitty/"

alias v="nvim"

# replace some existing programs
alias cat='bat'
alias less='bat'
alias grep='rg'
alias ls="exa --icons"
alias la="exa -la --icons"
alias tree="exa --tree"

alias ide="~/.script/ide.sh"
alias doomemacs="emacs --with-profile doom"
alias lg='lazygit'
alias luamake=/Users/spaceman/.config/nvim/lua-language-server/3rd/luamake/luamake


alias gwls='git worktree list'

alias vzk='cd ~/Dropbox/notes/ && nvim ./index.md'

# alias check-log2="
# echo dev:
# git log origin/development --oneline  --pretty=format:'%h - %aD (%ar)%d%n  %s - %an' | grep '$(git rev-parse --short HEAD)'
# echo staging:
# git log origin/staging --oneline  --pretty=format:'%h - %aD (%ar)%d%n  %s - %an' | grep '$(git rev-parse --short HEAD)'
# echo master:
# git log origin/master --oneline  --pretty=format:'%h - %aD (%ar)%d%n  %s - %an' | grep '$(git rev-parse --short HEAD)'"



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# from fzf
[ -f ~/.fzf.sh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || exa --tree {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || exa --tree {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'exa --tree {} | head -200'"
export FZF_BASE=/opt/homebrew/bin/fzf
export FZF_DEFAULT_COMMAND='fd --type f'

bindkey '^X^T' fzf-file-widget
bindkey '^F' fzf-file-widget
export PATH=~/.local/bin:"$PATH"

bindkey '^X^G' gch
gch() {
 git checkout $(git branch —l | fzf )
}

# Golang
export GOOS=darwin
export GOARCH=arm64

export ZK_NOTEBOOK_DIR="$HOME/Dropbox/notes/"

# Flutter
export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:/Users/spaceman/Library/Android/sdk"

eval "$(rbenv init - zsh)"
