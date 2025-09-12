LATEST_GRAAL_JDK=21-graalce

sudo apt-get install -y build-essential libz-dev zlib1g-dev

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java ${LATEST_GRAAL_JDK}

export GRAALVM_HOME=`sdk home java ${LATEST_GRAAL_JDK}`
export JAVA_HOME=${GRAALVM_HOME}
export PATH=${GRAALVM_HOME}/bin:${PATH}
