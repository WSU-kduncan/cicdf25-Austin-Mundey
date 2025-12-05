#!/bin/bash

sudo docker stop site || true
sudo docker rm site || true

sudo docker pull austinwsu/project4-site:latest

sudo docker run -d --restart=always -p 80:80 --name site austinwsu/project4-site:latest
