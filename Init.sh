#!/bin/bash
# Init script for adding aliases into a new command window.
#
# Installation steps:
#
# 1. chmod +x Init.sh
# 2. ./Init.sh

# Error handling for any nonzero exit code
# https://stackoverflow.com/questions/64786/error-handling-in-bash#69808
handle_error() {
  local parent_lineno="$1"
  local message="$2"
  local code="${3:-1}"
  if [[ -n "$message" ]] ; then
    echo "Error on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
  else
    echo "Error on or near line ${parent_lineno}; exiting with status ${code}"
  fi
  exit "${code}"
}
trap 'handle_error ${LINENO}' ERR

SCRIPTDIR=$(dirname "$(readlink -f "$0")")

__GitUserName=$(git config user.name)

echo
echo ==========================================================================
echo Setting aliases for easier command line experience
echo ==========================================================================
echo

alias master="git checkout master"
alias cb="git checkout dev/$__GitUserName/$*"
alias nb="git checkout master && git checkout -b dev/$__GitUserName/$*"
alias pull="git pull"
alias branch="git branch"
alias stat="git status"
alias mmerge="git checkout master && git merge dev/$__GitUserName/$* --squash && git commit"
alias push="for /F "usebackq" %b in (`git rev-parse --abbrev-ref HEAD`) do git push --set-upstream origin %b"
alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. & cd .."
