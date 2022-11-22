# deploygentoo
you can use any linux distro to install gentoo, do not use a live CD cuz' it got no browser to read gentoo wiki.

## .config
this is my gentoo-6.0.5 kernel config file, with dockcer support enabled.
more spec:
intel wireless card, GPT partition table(use uuid in fstab)

## partition
...

## before chroot
1. mount /dev/somepart /gentoo
2. cd /gentoo && wget some-stage3.tar.xz
3. tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
4. cp --dereference /etc/resolv.conf /gentoo/etc/
5. put portage conf into /gentoo, edit in host machine by nvim if needed
because default stage3 provides nano which...
6. ch_gentoo.sh

## in chroot
0. tweak make.conf, maybe change mirrors in it.
1. emerge-webrsync
   emerge --sync
2. eselect profile list
   eselect profile set [n]
3. emerge --ask --verbose --update --deep --newuse @world
4. change USE in make.conf
5. set locale and timezone
6. install firmware and source
7. you DO NOT need gen-kernel package, dracut is much faster.
8. kernel config, enble GPT if you use uuid in /etc/fstab, enable EFI stub for showing kernel message when booting
9. make kernel, install refind or grub

## config

1. enable wpa_supplicant by rc and dhcpcd if you use wifi, change /etc/conf.d/net to match your network interface, as well as /etc/init.d/wap_supplicant, /etc/conf.d/wap_supplicant, genarate a conf use wpa_passphrase, add it to wpa_supplicant scripts mentioned before.
2. install dwm and other goodies.
