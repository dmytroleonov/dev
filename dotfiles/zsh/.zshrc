export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# User configuration
export GIT_EDITOR=nvim

alias la="ls -A"
alias gs="git status -u"
alias gc="git commit"
alias ga="git add"
alias gp="git push"
alias gcane="git commit --amend --no-edit"
alias gl="git log --oneline"
alias gb="git branch"
alias gca="git commit --amend"
alias gpf="git push --force-with-lease"
alias gco="git checkout"
alias gpr="git pull --rebase"
alias gr="git rebase"
alias grc="git rebase --continue"
alias nr="npm run"
alias vim="nvim"

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob

ZSH_THEME="robbyrussell"

plugins=(zsh-autocomplete zsh-syntax-highlighting)

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

for plugin in /usr/share/zsh/plugins/*; do
  source $plugin/*.plugin.zsh 2>/dev/null
done

eval "$(starship init zsh)"
