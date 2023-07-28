# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Adds Sublime Text to path
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"


alias vim="nvim"
alias htdocs="cd ~/Sites"


# File-system
alias ll="ls -la --color=always"

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

start() { nohup $1 &> /dev/null & disown; }

alias tree="find . -print -type d \( -path ./.git -o -path ./node_modules \) -prune | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias path='echo -e ${PATH//:/\\n}'


# Git
[[ -r '/usr/local/etc/profile.d/bash_completion.sh' ]] && . '/usr/local/etc/profile.d/bash_completion.sh'

alias timeToday='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cgreen%d %Creset%s" --date=short --no-merges --since="midnight" --author="benjaminbank@gmail.com"'
alias timeTodayShort='git log --pretty=format:"%Creset%s" --date=short --no-merges --since="midnight" --author="benjaminbank@gmail.com"'

alias timeYesterday='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cgreen%d %Creset%s" --date=short --no-merges --since="yesterday.midnight" --author="benjaminbank@gmail.com"'

alias timeWeek='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cgreen%d %Creset%s" --date=short --no-merges --since="1 week ago" --author="benjaminbank@gmail.com"'
alias timeWeekShort='git log --pretty=format:"(%ad) %Cgreen%d %Creset%s" --date=short --no-merges --since="1 week ago" --author="benjaminbank@gmail.com"'


# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Docker
alias d:killall='docker kill $(docker ps -q)'
alias d:removeall='docker rm $(docker ps -a -q)'


# ingatlan.com
alias d:up='docker-compose up'
alias d:up:b='docker-compose up -d --build'
alias d:down='docker-compose down --remove-orphans'
alias d:composer:i='docker-compose run --rm php composer install'
alias d:npm:i='rm -rf node_modules && docker-compose run --rm node npm install'

alias d:traefik='docker run -p 8080:8080 -p 80:80 --restart always -d --network traefik_proxy -v /var/run/docker.sock:/var/run/docker.sock traefik:v2.9 --providers.docker.endpoint=unix:///var/run/docker.sock --providers.docker.exposedByDefault=false --api.insecure=true'

alias b:frontend='npm run build'
alias w:frontend='npm run watch'

alias w:icomfrontend='docker-compose run --rm --entrypoint="" node node_modules/.bin/grunt'

alias c:hird='rm -rf node_modules && docker-compose run --rm node npm run install'
alias b:hird='docker-compose run --rm node npm run install'
alias w:hird='docker-compose run --rm node npm run install && docker-compose run --rm node npm run watch'

alias c:office='rm -rf node_modules && docker-compose run --rm node npm run install'
alias b:office='docker-compose run --rm node npm run build'
alias w:office='docker-compose run --rm node npm run build && docker-compose run --rm node npm run watch'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
