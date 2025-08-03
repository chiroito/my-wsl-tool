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

# for PDF Combine
sudo apt install -y poppler-utils

# for GraalVM Native Image
sudo apt-get install -y build-essential libz-dev zlib1g-dev

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
