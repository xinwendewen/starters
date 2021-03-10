# !/bin/bash
#
#
readonly PROPERTIES_FILE="$HOME/.gradle/gradle.properties"
readonly CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${CURRENT_DIR}/starter.conf

main() {
    if [[ -z "${PROXY_HOST}" || -z "${PROXY_PORT}" ]]; then
        echo "No proxy configuration in starter.conf"
        return 1
    fi
    test -f $PROPERTIES_FILE || touch $PROPERTIES_FILE
    echo "systemProp.http.proxyHost=${PROXY_HOST}" >> $PROPERTIES_FILE
    echo "systemProp.http.proxyPort=${PROXY_PORT}" >> $PROPERTIES_FILE
    echo "systemProp.http.proxyUser=${PROXY_USER}" >> $PROPERTIES_FILE
    echo "systemProp.http.proxyPassword=${PROXY_PWD}" >> $PROPERTIES_FILE
    echo "systemProp.https.proxyHost=${PROXY_HOST}" >> $PROPERTIES_FILE
    echo "systemProp.https.proxyPort=${PROXY_PORT}" >> $PROPERTIES_FILE
    echo "systemProp.https.proxyUser=${PROXY_USER}" >> $PROPERTIES_FILE
    echo "systemProp.https.proxyPassword=${PROXY_PWD}" >> $PROPERTIES_FILE
}

main
