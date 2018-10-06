#!/usr/bin/env bash

SCRIPTS_DIR="$HOME/.scripts"
CONFIG_DIR="$HOME/.config"
I3_CONFIG_DIR="$CONFIG_DIR/i3"
I3_BLOCKS_CONFIG_DIR="$CONFIG_DIR/i3blocks"

I3_CONTRIB_REPO="https://github.com/vivien/i3blocks-contrib.git"

pkg.link() {
  if [ ! -d "$I3_CONFIG_DIR" ]; then
    mkdir -p "$I3_CONFIG_DIR"
  fi

  if [ ! -d "$I3_BLOCKS_CONFIG_DIR" ]; then
    mkdir -p "$I3_BLOCKS_CONFIG_DIR"
  fi

  case $(os.platform) in
    linux)
      fs.link_file "platforms/linux/i3/config" "$I3_CONFIG_DIR/config"
      fs.link_file "platforms/linux/i3blocks/config" "$I3_BLOCKS_CONFIG_DIR/config"
      ;;
  esac
}

pkg.install() {
  if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p "$SCRIPTS_DIR"
  fi

  cd $SCRIPTS_DIR
  git clone "$I3_CONTRIB_REPO"
}

pkg.pull() {
  git.pull
}

pkg.unlink() {
  rm -r "$I3_CONFIG_DIR $I3_BLOCKS_CONFIG_DIR"

  hooks.unlink
}
