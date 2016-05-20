
alias git-log="git log --graph --all --date=format:'%a %Y-%m-%d %H:%M:%S' --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n           %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"

alias git-hash='git rev-parse HEAD'

git config --global pull.rebase true

# find template in files folder
# git config --global commit.template ~/git_commit_template.txt

# npm install --global commitizen
# npm install --global standard-version
# npm install --global conventional-recommended-bump
