#!/usr/bin/env bash
set -e

# this script is obsoleted by
# pod ipc spec aBlinkingLabel.podspec | jq -r .version



# provide .podspec as input

if [ "$#" -ne 1 ]; then
  echo "example: $0 somefile.podspec"
  exit 1
fi

ruby -r cocoapods -- <<EOF
a =
`cat $1`
puts a.version
EOF
