#!/bin/bash

sudo apt update

# for OpenJDK
sudo apt-get install -y zip unzip autoconf make

# for PDF Combine
sudo apt install -y poppler-utils

# for GraalVM Native Image
sudo apt-get install -y build-essential libz-dev zlib1g-dev

# for Quarkus
sudo apt-get install -y openjdk-17-jre-headless maven
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
