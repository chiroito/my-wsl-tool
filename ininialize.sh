#!/bin/bash

sudo apt update

sudo apt-get install -y git
git config --global core.autocrlf false

# for OpenJDK
sudo apt-get install -y zip unzip autoconf make

git clone https://github.com/openjdk/jtreg.git /mnt/d/dev/jtreg
git clone https://github.com/openjdk/jdk.git /mnt/d/dev/jdk
locale-gen en_US.UTF-8; update-locale LANG=en_US.UTF-8; export LANG=en_US.UTF-8
export JTREG="VM_OPTIONS=-Duser.language=en -Duser.country=US"
# Install Microsoft Visual Studio Community Edition
# Install the latest OpenJDK for Windows
# cd /mnt/d/dev/jtreg; bash make/build.sh --jdk <OpenJDK on Linux>
# cd /mnt/d/dev/jdk; bash configure --with-boot-jdk=/mnt/d/opt/jdks/jdk-22 --with-toolchain-version=2022 --with-jtreg=/mnt/d/dev/jtreg/build/images/jtreg
# make images
# make test-tier1

# for PDF Combine
sudo apt install -y poppler-utils

# for GraalVM Native Image
sudo apt-get install -y build-essential libz-dev zlib1g-dev

# for Quarkus
sudo apt-get install -y openjdk-17-jre-headless maven
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
