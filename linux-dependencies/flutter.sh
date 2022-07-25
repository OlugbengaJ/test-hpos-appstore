#!/usr/bin/env bash

for filename in ./*.sh; do
  chmod +x "$filename"
done

# https://docs.flutter.dev/desktop#linux 
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-0 libblkid1 liblzma5

