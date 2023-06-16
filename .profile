export HISTSIZE=1000000
export HISTFILESIZE=1000000000

export EDITOR="emacs -nw"
export LESSCHARSET="utf-8"

export GTK_IM_MODULE=xim

if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f .env ]; then
  source .env
fi

if [ -e "${HOME}/.iterm2_shell_integration.bash" ]; then
  source "${HOME}/.iterm2_shell_integration.bash"
fi
