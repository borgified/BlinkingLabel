#!/usr/bin/env bash
set -e

releaseSDKVersion="$1"

sed -i '' -e "s/\(s\.version[ ]*\)=[ ]*\".*\"/\1= \"${releaseSDKVersion}\"/g" aBlinkingLabel.podspec
