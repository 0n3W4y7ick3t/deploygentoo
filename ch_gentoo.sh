#!/bin/bash

mount -t proc /proc /gentoo/proc
mount --rbind /sys  /gentoo/sys
mount --make-rslave /gentoo/sys
mount --rbind /dev  /gentoo/dev
mount --make-rslave /gentoo/dev
mount --rbind /run  /gentoo/run
mount --make-rslave /gentoo/run

chroot /gentoo /bin/bash
