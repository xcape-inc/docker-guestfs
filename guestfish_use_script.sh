#!/bin/bash
set -e
trap 'catch $? $LINENO' ERR
catch() {
  echo "Error $1 occurred on $2"
}
PARAMS=$1
if [[ "${PARAMS}" == '' ]]; then
  echo 'Script requires parameters'; false
fi
set -euo pipefail
PARAMS=("$@")
#if [[ "${#PARAMS[@]}" -lt 2 ]]; then
#  echo 'Script requires atleast 2 parameters'; echo "$0 IMAGE_PATH DEVICE_PATH"; false
#fi

GUESTFISH_SCRIPT_CONTENTS="${PARAMS[0]}"
GUESTFISH_SCRIPT_PATH="${PARAMS[1]:-/tmp/guestfish.script}"

printf '%s' "${GUESTFISH_SCRIPT_CONTENTS}" > "${GUESTFISH_SCRIPT_PATH}"
guestfish -f "${GUESTFISH_SCRIPT_PATH}"
