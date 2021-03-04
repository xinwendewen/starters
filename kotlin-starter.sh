# !/bin/bash
#
# create a kotlin project in current directory
set -e

SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"
source ${SCRIPT_DIR}/starter.conf

readonly project_name="$1"

main() {
    gradle --version
    mkdir ${project_name} && cd ${project_name}
    echo init gradle wrapper version:${GRADLE_VERSION}
    gradle wrapper --gradle-version "${GRADLE_VERSION}"
    ./gradlew init --project-name ${project_name} \
                   --type kotlin-library \
                   --test-framework kotlintest
    ./gradlew test
}

main
