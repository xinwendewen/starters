# !/bin/bash
#
# create a flutter app project in current directory
set -e
set -u

SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"
source ${SCRIPT_DIR}/starter.conf

readonly project_name="$1"

main() {
    flutter --version
    flutter create $project_name
}

main
