#!/bin/bash
staff=("doe_j" "hitchcock_a" "joplin_j")
mkdir -p /data/staff
for i in "${staff[@]}"; do 
        mkdir -p /data/home/"$i"
        useradd -m -G staff "$i"
        echo '"Hello World!"' > /data/home/"$i"/mysecretfile
        chown -R "$i" /data/home/"$i"
        chmod -R 700 /data/home/"$i"
done
chgrp staff /data/staff/
chmod -R 070 /data/staff/
cat /etc/group | grep staff > /home/connor_s/staff
chown connor_s /home/connor_s/staff
