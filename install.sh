#!/bin/bash
main () {
  SCRIPT_DIR=$(cd $(dirname $0); pwd)
  DOT_FILES=(.gitconfig .tmux.conf .zshrc)

  for file in ${DOT_FILES[@]}
  do
    ln -sfnv $SCRIPT_DIR/$file $HOME/$file
  done
}


main
