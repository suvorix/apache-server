#!/bin/bash
name=${1}
dname=${2}
useradd -d /data/www/${dname} -s /bin/bash -m ${name}
passwd ${name}
lamp add
chown -R ${name}:${name} /data/www/${dname}