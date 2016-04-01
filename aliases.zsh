# Aliases ######################################################################
alias zsh_config_reload='source ~/.zshrc' # reload .zshrc
alias zsh_config='atom ~/.zsh' # open zsh config folder

alias mv='\mv -i' # ask before overwrite file
alias cp='\cp -i' # ask before overwrite file
alias rm='\rm -i' # ask before remove file

alias ls="ls -Gl"
alias grep='grep --color=auto'

alias http-server='\http-server -p 8080 -o' # npm i -g http-server
alias http-server-ssl='\http-server -p 8443 -o --ssl --cert ~/.ssl/localhost.pem --key ~/.ssl/localhost.pem '
alias https-server='http-server-ssl'
# OSX: sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.ssl/localhost.pem

alias gitlog="git log --graph --all --date=format:'%a %Y-%m-%d %H:%M:%S' --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n           %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"


##### suffix aliases

#alias -s jpeg="open"
