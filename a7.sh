#!/bin/bash
staff=("doe_j" "hitchcock_a" "joplin_j" "connor_s")
mkdir -p /data/staff && for i in "${staff[@]}"; do mkdir -p /data/home/"$i";done
for i in "${staff[@]}"; do 
        if [ "$i" = "connor_s" ]; then
                useradd -m -G sudo "$i"; else
        useradd -G staff "$i"
        fi
done
chgrp staff /data/staff/
chmod -R 070 /data/staff/
for i in "${staff[@]}"; do
        echo '"Hello World!"' > /data/home/"$i"/mysecretfile && \
        chmod -R 700 /data/home/"$i"
done
cat /etc/group | grep staff > /home/connor_s/staff
chown connor_s /home/connor_s/staff
