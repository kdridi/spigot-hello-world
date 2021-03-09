#!/usr/bin/env bash

set -e

cd $(dirname $0)
export SPIGOT_DIR="$(pwd)/.deps/spigot"
export SPIGOT_VERSION="1.16.5"
cd - >/dev/null


if [[ ! -f "${SPIGOT_DIR}/spigot-${SPIGOT_VERSION}.jar" ]]; then
	rm -rf "${SPIGOT_DIR}"
	mkdir -p "${SPIGOT_DIR}"
	cd "${SPIGOT_DIR}"

	curl -o "BuildTools.jar" "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

	export MAVEN_OPTS="-Xmx2G"
	java -Xmx2G -jar BuildTools.jar --rev "${SPIGOT_VERSION}"
fi

mvn install:install-file \
   -Dfile="${SPIGOT_DIR}/spigot-${SPIGOT_VERSION}.jar" \
   -DgroupId="spigot" \
   -DartifactId="spigot" \
   -Dversion="${SPIGOT_VERSION}" \
   -Dpackaging="jar" \
   -DgeneratePom=true