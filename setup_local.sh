#!/bin/bash

#---- Git and GitHub ----#
brew install git gh jq gpg pinentry-mac gnupg
brew install --cask git-credential-manager

#---- Terminal themes ----#
ln -s $HOME/Projects/smyleeface/pattyr.zsh-theme $HOME/.oh-my-zsh/themes/pattyr.zsh-theme
read -p "In ~/.zshrc, change \`ZSH_THEME=\"jonathan\"\` to \`ZSH_THEME=\"pattyr\"\`. Press any key to continue..."

#---- Language managers ----#
brew install asdf
ln -s $HOME/Projects/smyleeface/.tool-versions $HOME/.tool-versions
asdf install

#---- Python global installs ----#
pip install -r requirements.txt

#---- Node global installs ----#
for line in $(jq -c '.global | to_entries[]' < package.json); do
    key=$(echo $line | jq -r '.key')
    value=$(echo $line | jq -r '.value')
    command="npm install -g $key@$value"
    echo "$command"
    $command
done

#---- configure gpg for IDE ----#
cp -f gpg.conf $HOME/.gnupg/gpg.conf
cp -f gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
