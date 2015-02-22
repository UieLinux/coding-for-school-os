#!/bin/bash
qemu-system-arm \
  -kernel zImage-3.18.7 \
  -cpu arm1176 \
  -M versatilepb \
  -m 256 \
  -no-reboot \
  -serial stdio \
  -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw init=/bin/bash" \
-hda 2015-02-16-raspbian-wheezy.img \
  -k it \
  -display sdl
