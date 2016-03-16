function git-log {
  git log --graph --all --date=format:'%Y-%m-%d %H:%M' --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n           %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
}
