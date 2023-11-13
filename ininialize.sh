#!/bin/bash

sudo apt update

# for OpenJDK
sudo apt-get install -y zip unzip autoconf make

# for PDF Combine
sudo apt install -y poppler-utils

# for GraalVM Native Image
sudo apt-get install -y build-essential libz-dev zlib1g-dev
