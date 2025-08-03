# on WSL1
# You must install one of the latest major openjdk binary on windows to build openjdk
# and install Microsoft Visual Studio Community Edition

LATEST_WINDOWS_JDK_DIR=/mnt/d/opt/jdks/temurin-24+36
LATEST_LINUX_JDK=24-tem
OPENJDK_REPO_USER=openjdk
JTREG_DIR=/mnt/d/dev/jtreg
JDK_DIR=/mnt/d/dev/jdk

sudo apt update

# install packages
sudo apt-get install -y git zip unzip autoconf make libasound2-dev libcups2-dev libfontconfig1-dev libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev

# 
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java latest-jdk-win ${LATEST_WINDOWS_JDK_DIR}
sdk use java latest-jdk-win
sdk install java ${LATEST_LINUX_JDK}

locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# build JTREG
export JTREG="VM_OPTIONS=-Duser.language=en -Duser.country=US"
git clone https://github.com/openjdk/jtreg.git ${JTREG_DIR}
cd /mnt/d/dev/jtreg
bash make/build.sh --jdk `sdk home java ${LATEST_LINUX_JDK}`

# build OpenJDK 
git clone https://github.com/${OPENJDK_REPO_USER}/jdk.git ${JDK_DIR}
cd /mnt/d/dev/jdk

# for Windows
bash configure --with-jtreg=${JTREG_DIR}/build/images/jtreg --with-boot-jdk=${LATEST_WINDOWS_JDK_DIR} --with-toolchain-version=2022
make images CONF=windows-x86_64-server-release

# for Linux
bash configure --with-jtreg=${JTREG_DIR}/build/images/jtreg --with-boot-jdk=`sdk home java ${LATEST_LINUX_JDK}` --build=x86_64-unknown-linux-gnu --openjdk-target=x86_64-unknown-linux-gnu
make images CONF=linux-x86_64-server-release

# make test-tier1 CONF=windows-x86_64-server-release
# make test TEST=test/jdk/jdk/jfr/XXX.java CONF=windows-x86_64-server-release
# make test TEST=test/jdk/jdk/jfr/XXX.java JTREG="TIMEOUT_FACTOR=0.1" CONF=windows-x86_64-server-release
