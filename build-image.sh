#!/bin/bash

cp -R ~/.m2 ./.m2
cp ~/.vimrc ./.vimrc
cp -R ~/.vim ./.vim
cp ~/.tmux.conf ./.tmux.conf
cp ~/.bashrc ./.bashrc
cp ~/.bash_history ./.bash_history
cp -R ~/.ssh ./.ssh

docker build -t dockerdev:ap .

rm -Rf .ssh
rm -Rf .vim
rm .vimrc
rm .bash_history
rm .bashrc
rm .tmux.conf

