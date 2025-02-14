#!/bin/sh

##############################################################################
#                            License & Copyright                             #
#                                                                            #
# The materials herein are from "Into the Core: A look at Tiny Core Linux"   #
# (http://www.tinycorelinux.net/book.html) by Lauri Kasanen et al. The book  #
# is licensed under the CC BY-NC-SA 4.0 license (http://creativecommons.org/ #
# licenses/by-nc-sa/4.0/). (C) 2013 Lauri Kasanen.                           #
##############################################################################

# Extensions may optionally include a script to be run after they’re
# loaded. This is often used to adjust or configure the environment e.g.
# make configuration file writable, replace symlinks with real files etc.

# Install scripts are required to:
# - live in the /usr/local/tce.installed directory
# - be named after extension’s file name (e.g. myext-foo.tcz -> myext-foo)
# - run as root
# - be owned by tc:staff
# - have executable permissions

[ -f /usr/local/tce.installed/$0 ] && \
[ -f /etc/sysconfig/tcedir/optional/$0.tcz ] && \
[ $(id -u) -ne 0 ] && \
sudo chown tc:staff $0 && \
sudo chmod a+x $0

# /usr/local/tce.installed directory is required to:
# - be owned by root:staff
# - have 775 permissions

sudo chown root:staff /usr/local/tce.installed && \
sudo chmod 775 /usr/local/tce.installed

# Example: nano install script
# - replace read-only symlink to configuration file with a writable copy
# See: /usr/local/tce.installed/nano
