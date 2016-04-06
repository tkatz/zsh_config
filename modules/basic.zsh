# Aliases ######################################################################
alias mv='\mv -i' # ask before overwrite file
alias cp='\cp -i' # ask before overwrite file
alias rm='\rm -i' # ask before remove file

alias ls='ls -Gl' # colorize types
alias grep='grep --color=auto' # colorize matching parts

alias man "env LESS_TERMCAP_md=$(printf '\e[1;32m') LESS_TERMCAP_us=$(printf '\e[1;36m') LESS_TERMCAP_ue=$(printf '\e[0m') man" #colorize manpage

# install OSX: sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.ssl/localhost.pem

##### suffix aliases

#alias -s jpeg="open"
