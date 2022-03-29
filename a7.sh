#!/bin/bash
staff=("doe_j" "hitchcock_a" "joplin_j")
badpass='asdfASDF1234!@#$'
mkdir -p /data/{staff,home}
chgrp staff /data/staff/
chmod -R 070 /data/staff/
for i in "${staff[@]}"; do 
    mkdir /data/home/"$i"
    useradd -m -G staff "$i" -s /bin/bash
    echo "$i":$badpass | chpasswd
    echo '"Hello World!"' > /data/home/"$i"/mysecretfile
    chown -R "$i" /data/home/"$i"
    chmod -R 700 /data/home/"$i"
done
useradd -m -G sudo connor_s -s /bin/bash
echo connor_s:$badpass | chpasswd
cat /etc/group | grep staff > /home/connor_s/staff
