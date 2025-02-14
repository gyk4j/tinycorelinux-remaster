# Scripts to remaster Tiny Core Linux

Remastering [Tiny Core Linux][tinycore] allows us to create customized bootable 
Linux ISO images that provides a minimal live Linux environment for shipping 
and running software.

*Tiny Core Linux Remaster* is a set of shell scripts to automate 
[Tiny Core Linux][tinycore] remastering. These scripts demonstrate different 
methods of customizing the base [Tiny Core Linux][tinycore] ISO image:

1. Repacking [initial ramdisk][initrd] image
2. Adding and loading additional custom [initial ramdisk][initrd] image
3. Building and loading extensions

> [!NOTE]
>   
> The information in this repository is mainly taken from the free book 
> ["Into the Core: A look at Tiny Core Linux" by Lauri Kasanen et al][book].
>   
> The pertinent commands for remastering are extracted for easy reference.
>   
> Reading the book for a better understanding is encouraged.
>   

![Boot](doc/assets/images/1-kernel.png)  
_Fig 1. Bootloader decompressing and loading kernel_

![Services and Daemons](doc/assets/images/2-booting.png)  
_Fig 2. Kernel booting and starting services_

![Shutdown](doc/assets/images/3-shutdown.png)  
_Fig 3. Shut down_

[tinycore]: http://www.tinycorelinux.net
[initrd]: https://en.wikipedia.org/wiki/Initial_ramdisk
[book]: http://www.tinycorelinux.net/book.html
