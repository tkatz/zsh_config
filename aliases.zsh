# Aliases ######################################################################
alias .zshrc='source ~/.zshrc' # reload .zshrc

alias mv='mv -i' # ask before overwrite file
alias cp='cp -i' # ask before overwrite file
alias rm='rm -i' # ask before remove file

alias ls="ls -FGl"
alias grep='grep --color=auto'

alias http-server="open http://localhost:8080; http-server"
alias http-server-ssl='http-server --ssl --cert /.ssl/localhost.pem --key /.ssl/localhost.pem'

alias gitlog="git log --graph --all --date=format:'%a %Y-%m-%d %H:%M:%S' --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n           %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"


#alias simple_http_server='open http://localhost:8000; python -m SimpleHTTPServer'

##### suffix aliases

#alias -s jpeg="open"
