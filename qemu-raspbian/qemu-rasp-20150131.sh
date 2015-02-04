#!/bin/bash
qemu-system-arm \
-kernel kernel-qemu-3.18.5 \
  -cpu arm1176 \
  -M versatilepb \
  -m 256 \
  -no-reboot \
  -serial stdio \
  -append "root=/dev/sda2 panic=1 rootfstype=ext4 ro" \
  -hda 2015-01-31-raspbian.img \
  -k it \
  -display sdl
