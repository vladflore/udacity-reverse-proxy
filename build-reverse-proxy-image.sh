#!/bin/bash
echo "Building Reverse Proxy Docker Image"
cd ./reverse-proxy
pwd
docker --version
# docker build -t simple-reverse-proxy .
# docker tag simple-reverse-proxy vladflore/simple-reverse-proxy:latest