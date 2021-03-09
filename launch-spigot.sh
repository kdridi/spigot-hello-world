#!/usr/bin/env bash

set -e

cd $(dirname $0)

ROOT_DIR="$(pwd)"
SPIGOT_DIR="${ROOT_DIR}/.deps/spigot"
SPIGOT_VERSION="1.16.5"
SERVER_DIR="${ROOT_DIR}/server"

cd "${ROOT_DIR}"
./install-spigot.sh

cd "${ROOT_DIR}"
mvn package
mkdir -p "${SERVER_DIR}/plugins"
cp target/hello-*.jar "${SERVER_DIR}/plugins/hello.jar"

cd "${SERVER_DIR}"
export MAVEN_OPTS="-Xms8G -Xmx12G -XX:+UseG1GC"
java ${MAVEN_OPTS} -jar "${SPIGOT_DIR}/spigot-${SPIGOT_VERSION}.jar" --nogui