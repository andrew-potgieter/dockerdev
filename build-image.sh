#!/bin/bash

mkdir target
cp -r ~/.m2/ target/.m2
cp ~/.vimrc target
cp vim-init target
cp -r ~/.vim/ target/.vim
cp ~/.tmux.conf target
cp -r ~/.ssh/ target/.ssh
cp  ~/.zsh* target
cp -r ~/.oh-my-zsh/ target/.oh-my-zsh
cp -r ~/.lein target/.lein

cp dev-docker-run-cmd.sh target

docker build -t dockerdev:ap .

rm -Rf target

