#!/bin/bash
qemu-system-arm \
  -kernel kernel-qemu \
  -cpu arm1176 \
  -M versatilepb \
  -m 256 \
  -no-reboot \
  -serial stdio \
  -append "root=/dev/sda2 panic=1 rootfstype=ext4 ro" \
-hda 2014-12-24-wheezy-raspbian.img \
  -k it \
  -display sdl
