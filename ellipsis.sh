#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config"
I3_CONFIG_DIR="$CONFIG_DIR/i3"
I3_BLOCKS_CONFIG_DIR="$CONFIG_DIR/i3blocks"

pkg.link() {
  mkdir -p "$I3_CONFIG_DIR"
  mkdir -p "$I3_BLOCKS_CONFIG_DIR"

  case $(os.platform) in
    linux)
      fs.link_file "platforms/linux/i3/config" "$I3_CONFIG_DIR/config"
      fs.link_file "platforms/linux/i3blocks/config" "$I3_BLOCKS_CONFIG_DIR/config"
      ;;
  esac
}

pkg.pull() {
  git.pull
}

pkg.unlink() {
  rm -r "$I3_CONFIG_DIR $I3_BLOCKS_CONFIG_DIR"

  hooks.unlink
}
