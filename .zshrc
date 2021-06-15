alias zshconfig="vim ~/.zshrc"

alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bnbi='bin/next bundle install'

alias ga='git add .'
alias gau='git add --update'
alias gb='git branch'
alias gbD='git branch -D'
alias gca='git commit -a -m'
alias gcam='git commit --amend --no-edit'
alias gcau='gau && gca'
alias gcb='git checkout $(git for-each-ref --sort=-committerdate --count=50 --format="%(refname:short)" refs/heads/ | selecta)'
alias gcm='git commit -m'
alias gco='git checkout'
alias gf='git fetch'
alias gfo'git fetch && git checkout'
alias gcob='git checkout -b'
alias gcom='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git pull --prune'
alias gL='git log --pretty=oneline'
alias gp='git push -u origin HEAD'
alias gpf='git push -u origin HEAD --force'
alias gP='git pull origin $(current_branch)'
alias gpoh='git push origin $(current_branch)'
alias gri='EDITOR=vim git rebase -i'
alias gri5='EDITOR=vim git rebase -i HEAD~5' 
alias grm='git rebase master'
alias gs='git status'
alias gS='git show'
alias gst='git stash'
alias gstp='git stash pop'
alias tb='git commit --allow-empty -m "Trigger Build"'

alias h='history | fzf +s --tac'
alias ms='bin/mod-spec'
alias themis='cd clio/themis'

# gbd - delete git branch (including remote branches)
gbd() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function db {
  case $1 in
    1) db="themis_development_1";;
    2) db="themis_development_2";;
    *) db="common_development";;
  esac

  echo "😘😘  CONNECTING TO `$db` 😘😘"
  mysql --host=127.0.0.1 --port=xxxx --user=xxxx --password=xxxx $db
}

export EDITOR=code
eval "$(dev _hook)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
