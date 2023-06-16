if [ -f .bash_aliases ]; then
  source .bash_aliases
fi

if [ -f .bash_prompt ]; then
  source .bash_prompt
fi

if [ -f .gitcompletion.bash ]; then
  source .gitcompletion.bash
fi

# Node.js version manager
if [ -d .nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  if [ -f .nvmrc ]; then
    nvm use
  else
    nvm use default
  fi
fi
