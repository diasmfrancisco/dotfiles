autoload -U promptinit # initialize the prompt system promptinit

# Dealing wiht LOCALE errors
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/roles/dotfiles/oh-my-zsh"

# Path to conda
export PATH="/Users/fmcdg/miniconda3/bin:$PATH"

# Start up with default tmux
# if [ -z "$TMUX" ]; then
    # tmux attach -t default || tmux new -s default
# fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="ys"
# ZSH_THEME="theunraveler"


# Powerlevel stuff
# POWERLEVEL9K_MODE='awesome-patched'
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-z zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh

# Alias for python 3.6
# alias python='python3.6'
# alias 2='python2.7'
# alias 3='python3.6'
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="-- extended"
# export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*"'
# export FZF_DEFAULT_COMMAND='if [ -f cscope.files ]; then cat cscope.files; else find ./ -type f ; fi'

export FZF_T_COMMAND="$FZF_DEFAULT_COMMAND"



######################################################################
######################################################################
# Aliases

# Alias for switching to notes directory
alias ntx='cd ~/Sync/notes/'

# Git aliases

# Merging and checkout
alias gck="git checkout" + branch
alias gmg="git merge" # + branch

# Alias for add and commit
alias gac="git add . && git commit -m" # + commit message

# Pushing/pulling to origin remote
alias gpo="git push origin" # + branch name
alias glo="git pull origin" # + branch name

# Pushing/pulling to origin remote, master branch
alias gpom="git push origin master"
alias glom="git pull origin master"

# Git reset --hard
alias grhh="git reset --hard"

# Alias for initialization
alias gi="git init && gac 'Initial commit'"


# Tmux aliase
alias tmux="tmux -2"

# Alias for tmux attach or new, depends
alias tm="tmux attach || tmux new"

# Alias for creating and killing tmux session with specific name
alias tmn="tmux new -s" # + new session name
alias tmk="tmux kill-session -t" # + new session name
alias tma="tmux a -t mysession" # + session name

alias colt="/Users/fmcdg/roles/dotfiles/config/base16-shell/colortest"

# Google Drive download
alias gdw="/Users/fmcdg/roles/scripts/gdown.pl/gdown.pl"

# Alias fpr studying folder
alias advmt="cd ~/Dropbox/study-prep-masters/advanced-mathematics/"

# source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
# source ~/roles/dotfiles/p10k-lean.zsh

# Configuration for ~/.bash_profile, ~/.zshrc etc:
# Pipe anything into `clip` to forward it to Clipper
alias clip="nc localhost 8377"

# Alias for zathura
alias zf="zathura --mode fullscreen" # + the file!
alias zn="zathura" # + the file!

# Default: Base16 Shell
BASE16_SHELL=$HOME/roles/dotfiles/config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Ocean profile defaulted
# BASE16_SHELL="$HOME/roles/dotfiles/config/base16-shell/scripts/base16-ocean.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Default dark profile defaulted
# BASE16_SHELL="$HOME/roles/dotfiles/config/base16-shell/scripts/base16-defaut-dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

