# Scripts to remaster Tiny Core Linux

Remastering [Tiny Core Linux][tinycore] allows us to create customized bootable 
Linux ISO images that provides a minimal live Linux environment for shipping 
and running software.

*Tiny Core Linux Remaster* is a set of shell scripts to automate 
[Tiny Core Linux][tinycore] remastering. It demonstrates several approaches to
introducing customizations to the [Tiny Core Linux][tinycore] ISO image, namely
building and loading extensions, repacking and adding _initrd_ image 
(i.e. `core.gz`).

I am using the following as the remastering host:
- [Ubuntu 22.04 (Jammy Jellyfish)][ubuntu-jammy]
- [Alpine 3.20][alpine]
- [Tiny Core Linux 15.0][tinycore]

[tinycore]: http://www.tinycorelinux.net
[ubuntu-jammy]: https://releases.ubuntu.com/jammy/
[alpine]: https://www.alpinelinux.org
