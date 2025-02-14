#!/bin/sh

##############################################################################
#                            License & Copyright                             #
#                                                                            #
# The materials herein are from "Into the Core: A look at Tiny Core Linux"   #
# (http://www.tinycorelinux.net/book.html) by Lauri Kasanen et al. The book  #
# is licensed under the CC BY-NC-SA 4.0 license (http://creativecommons.org/ #
# licenses/by-nc-sa/4.0/). (C) 2013 Lauri Kasanen.                           #
##############################################################################

# Extract ISO image

sudo mkdir /mnt/tmp
sudo mount TinyCore-current.iso /mnt/tmp -o loop,ro
cp -a /mnt/tmp /tmp/newiso
sudo umount /mnt/tmp

# Download nano into tce directory

tce-load -w nano

# Copy nano and its dependencies to the cde directory

cd /etc/sysconfig/tcedir/optional
tce-fetch nano.tcz.tree
for file in `cat nano.tcz.tree`; do
  cp ${file}* /tmp/newiso/cde/optional
done

# Add it to onboot.lst, so it gets installed on boot.
echo nano.tcz >> /tmp/newiso/cde/onboot.lst

# Create ISO image

cd /tmp
mkisofs -l -J -r -V TC-custom -no-emul-boot \
  -boot-load-size 4 \
  -boot-info-table -b boot/isolinux/isolinux.bin \
  -c boot/isolinux/boot.cat -o TC-remastered.iso newiso

# Clean up

rm -rf newiso
