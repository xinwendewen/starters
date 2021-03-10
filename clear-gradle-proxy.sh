# !/bin/bash
#
#
set -u
set -e

readonly PROPERTIES_FILE="$HOME/.gradle/gradle.properties"

main() {
    sed -i -e "/proxy/d" "${PROPERTIES_FILE}"
}

main
