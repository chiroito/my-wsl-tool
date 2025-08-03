JAVA_VERSION=21
QUARKUS_REPO_USER=quarkusio
QUARKUS_INSTALL_DIR=/mnt/d/dev/quarkus

sudo apt update
sudo apt-get install -y git openjdk-${JAVA_VERSION}-jdk

locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8
export LANG=en_US.UTF-8

git clone https://github.com/${QUARKUS_REPO_USER}/quarkus.git ${QUARKUS_INSTALL_DIR}

cd ${QUARKUS_INSTALL_DIR}
./mvnw install -pl devtools/maven -am -Dquickly

# 以下は必要に応じて実行
# ./mvnw install -Dquickly
# ./mvnw test -pl integration-tests/jfr-blocking
# ./mvnw install -pl extensions/jfr -am
# ./mvnw install -pl extensions/infinispan-client -am
