alias ll="ls -la --color=always"

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

start() { nohup $1 &> /dev/null & disown; }

alias tree="find . -print -type d \( -path ./.git -o -path ./node_modules \) -prune | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias path='echo -e ${PATH//:/\\n}'
