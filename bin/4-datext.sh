#!/bin/sh

##############################################################################
#                            License & Copyright                             #
#                                                                            #
# The materials herein are from "Into the Core: A look at Tiny Core Linux"   #
# (http://www.tinycorelinux.net/book.html) by Lauri Kasanen et al. The book  #
# is licensed under the CC BY-NC-SA 4.0 license (http://creativecommons.org/ #
# licenses/by-nc-sa/4.0/). (C) 2013 Lauri Kasanen.                           #
##############################################################################

# To add some files.
#
# As an example, say you downloaded an icon theme from gnome-look.org. Icon 
# themes should be installed to /usr/share/icons/name for a system-wide 
# installation.

# Create directory structure containing custom files

sudo su
cd /tmp
mkdir myextension
cd myextension
mkdir -p usr/share/icons

# Fill with custom files and data
# Assuming the icon theme was unpacked to /tmp/gold
# (containing /tmp/gold/16x16 and other icon directories), move it to
# the proper place

sudo su # Still as root
mv /tmp/gold /tmp/myextension/usr/share/icons

# Create extension

cd /tmp
mksquashfs myextension myicons.tcz
# add '-b 4k -no-xattrs' switches for non-Tiny Core `mksquashfs` 

# Install the extension

cd /tmp
mv -v myicons.tcz /etc/sysconfig/tcedir/optional

# Load extension once for current session

tce-load -i myicons

# Adding it to onboot.lst. Skip if you want it OnDemand or not in any list at 
# all (manual loading only)

cd /etc/sysconfig/tcedir
echo myicons.tcz >> onboot.lst
