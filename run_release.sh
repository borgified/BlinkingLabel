#!/usr/bin/env bash
set -e

# Needs COCOAPODS_TRUNK_TOKEN defined in job settings

function release_github {
  CHANGELOG="CHANGELOG.md"

  NEW_VERSION=$(grep '^## ' ${CHANGELOG} | awk 'NR==1')
  LAST_VERSION=$(grep '^## ' ${CHANGELOG} | awk 'NR==2')

  DESCRIPTION=$(awk "/^${NEW_VERSION}$/,/^${LAST_VERSION}$/" ${CHANGELOG} | grep -v "^${LAST_VERSION}$")

  hub release create v${VERSION} -m "Release ${VERSION}" -m "${DESCRIPTION}"
}

function release_cocoapods {
  echo "do cocoapods"
  #pod trunk push --allow-warnings
}

function main {
  release_github
  release_cocoapods
}

main
