#!/bin/bash
# One-time setup script for using this repo.
#
# Assumes execution in normal privilege user context - sudo is invoked below.
# Also assumes Internet connectivity.
#
# Installation steps:
#
# 1. chmod +x Setup.sh
# 1. ./Setup.sh

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

echo
echo ==========================================================================
echo Installing Python 3, curl, and build tools
echo Plus libatlas-base-dev needed by Raspberry Pi for numeric support
echo ==========================================================================
sudo apt-get install -y curl build-essential python3 python3-pip libatlas-base-dev

echo
echo ==========================================================================
echo Installing Visual Studio Code
echo https://code.visualstudio.com/docs/setup/linux
echo ==========================================================================
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
#sudo apt-get install -y code

echo ""
echo ==========================================================================
echo Ensuring we have needed Python packages:
echo   pylint - Linter for Python, useful in Visual Studio Code.
echo   BiblioPixel - https://github.com/ManiacalLabs/BiblioPixel
echo ==========================================================================
echo ""
pip3 install pylint bibliopixel

chmod +x ./Init.sh
./Init.sh

echo
echo ==========================================================================
echo Complete!
echo ==========================================================================
echo

exit 0
