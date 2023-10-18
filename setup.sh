#!/bin/bash

#---- Git and GitHub ----#
brew install git gh

#---- Language managers ----#
brew install asdf
ln -s $HOME/Projects/smyleeface/.tool-versions $HOME/.tool-versions
asdf install

#---- Terminal themes ----#
ln -s $HOME/Projects/smyleeface/pattyr.zsh-theme $HOME/.oh-my-zsh/themes/pattyr.zsh-theme

read -p "In ~/.zshrc, change `ZSH_THEME=\"jonathan\"` to `ZSH_THEME=\"pattyr\"`"
