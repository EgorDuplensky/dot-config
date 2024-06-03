#!/bin/sh

# Configure Emacs build options.

./autogen.sh
mkdir build && cd build
# Replace `--with-pgtk` with `--with-cairo` if building for X11.
CFLAGS='-march=native -O3' ../configure \
    --with-modules \
    --with-xwidgets \
    --with-mailutils \
    --enable-acl \
    --with-imagemagick \
    --with-native-compilation=aot \
    --with-pgtk \
    --with-json \
    --with-tree-sitter
