#!/bin/bash

sudo apt update

sudo apt-get install -y git
git config --global core.autocrlf false
git config --global core.longpaths true
git config --global core.symlinks true
// Gitで鍵を使う
git config --global commit.gpgsign true
git config --global gpg.program "c:\Program Files (x86)\GnuPG\bin\gpg"
git config --global user.signingkey <自分の鍵>
# ローカルセキュリティーポリシーでシンボリックリンクの権限付与も必要

# for OpenJDK
sudo apt-get install -y zip unzip autoconf make

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 24-tem
# ローカルの JDK を登録
# sdk install java 24-tem-win /mnt/d/opt/jdks/temurin-24+36
# sdk use java 24-tem-win

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
sudo apt-get install -y maven

# SSH
sudo apt-get install -y openssh-server net-tools
adduser <自分のユーザ>
netsh.exe interface portproxy show v4tov4
netsh.exe interface portproxy add v4tov4 listenport=22 connectaddress=192.168.0.1

# OpenShift
# ocのダウンロード
# kubeconifgを.kube/configとして保存

# TODO: そのうち設定ファイルへ入れる
export PS1="[\u@\h \D{%Y%m%d-%H:%M:%S}]\$ "
