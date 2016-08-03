# Aliases ######################################################################
alias mv='\mv -i' # ask before overwrite file
alias cp='\cp -i' # ask before overwrite file
alias rm='\rm -i' # ask before remove file

alias ls='ls -Glh' # G - colorize types, l - long format, h - human readable
alias grep='grep --color=auto' # colorize matching parts

#colorize manpage
man() {
  env \
    LESS_TERMCAP_md=$(printf '\e[1;32m') \
    LESS_TERMCAP_us=$(printf '\e[1;36m') \
    LESS_TERMCAP_ue=$(printf '\e[0m') \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    man $@
}


# install OSX: sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.ssl/localhost.pem
