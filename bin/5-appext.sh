#!/bin/sh

##############################################################################
#                            License & Copyright                             #
#                                                                            #
# The materials herein are from "Into the Core: A look at Tiny Core Linux"   #
# (http://www.tinycorelinux.net/book.html) by Lauri Kasanen et al. The book  #
# is licensed under the CC BY-NC-SA 4.0 license (http://creativecommons.org/ #
# licenses/by-nc-sa/4.0/). (C) 2013 Lauri Kasanen.                           #
##############################################################################

# Create extension with binaries
# This example compiles `less` command from source into binary using 
# `autotool`, and package it as an extension.

# Build `less`

cd /tmp
cd less-458 # Latest version at the time
# Check the default options are OK
./configure --help | more
# They are OK for less. Go with the defaults.
./configure
# The process should run without errors.
# If not, google for the error message.
#
# Next, build less:
make

# Create extension directory tree

# Again as root, so that system directory
# permissions and ownership is correct.
sudo make DESTDIR=/tmp/destless install

# Remove unnecessary files e.g. man pages

cd /tmp/destless
sudo rm -rf usr/local/share

# Remove debugging symbols

cd /tmp/destless/usr/local/bin
sudo strip -g *

# Pack extension

cd /tmp
mksquashfs destless myless.tc
