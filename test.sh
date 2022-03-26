#!/bin/sh
staff=("doe_j" "hitchcock_a" "joplin_j")
mkdir -p /data/staff && for i in "${staff[@]}"; do mkdir -p /data/home/"$i";done
for i in "${staff[@]}"; do adduser "$i"; done
for i in "${staff[@]}"; do usermod -a -G staff "$i"; done
adduser connor_s
usermod -a -G sudo connor_s
chgrp staff /data/staff/
chmod -R 070 /data/staff/
for i in "${staff[@]}"; do echo '"Hello World!"' > /data/home/"$i"/mysecretfile; done
for i in "${staff[@]}"; do chmod -R 700 /data/home/"$i"; done
cat /etc/group | grep staff > /home/connor_s/staff
chown connor_s /home/connor_s/staff
