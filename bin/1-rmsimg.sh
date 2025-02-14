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
cp -a /mnt/tmp/boot /tmp
mv /tmp/boot/tinycore.gz /tmp
sudo umount /mnt/tmp

# Unpack initrd image

sudo mkdir /tmp/extract
cd /tmp/extract
zcat /tmp/tinycore.gz | sudo cpio -i -H newc -d

# Pack initrd image

cd /tmp/extract
sudo find | sudo cpio -o -H newc | \
gzip -2 > ../tinycore.gz
cd /tmp
advdef -z4 tinycore.gz

# Create ISO image

cd /tmp
mv tinycore.gz boot
mkdir newiso
mv boot newiso
mkisofs -l -J -r -V TC-custom -no-emul-boot \
-boot-load-size 4 \
-boot-info-table -b boot/isolinux/isolinux.bin \
-c boot/isolinux/boot.cat -o TC-remastered.iso newiso

# Optionally clean-up the temp dir
rm -rf newiso
