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
# ... as per 1-rmsimg.sh ...

# Create modified file for inclusion/overwriting in /tmp/ex directory

cd /tmp
sudo mkdir -p ex/etc
echo "I believe!" | sudo tee ex/etc/issue

# Pack initrd

cd /tmp/ex
sudo find | sudo cpio -o -H newc | gzip 2 > ../myimg.gz
advdef -z4 ../myimg.gz

# Update the bootloader
# Append additional custom initrd's using comma-separated format
sed -i "!initrd=/boot/core.gz!initrd=/boot/core.gz,/boot/myimg.gz!g" /tmp/isolinux/isolinux.cfg
# For bootloader that only supports one initrd (GRUB legacy, some DOS-based loaders, etc)
#cat core.gz myimg.gz > new.gz

# Build ISO image
# ... as per 1-rmsimg.sh ...