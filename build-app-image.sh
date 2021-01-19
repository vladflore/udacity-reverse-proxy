#!/bin/bash
echo "Building App Docker Image"
cd ./app
docker --version
docker build -t simple-express .
docker tag simple-express vladflore/simple-express:latest