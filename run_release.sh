#!/usr/bin/env bash
set -e

# Needs COCOAPODS_TRUNK_TOKEN defined in job settings
# Needs VERSION defined in .travis.yml

function release_github {
  CHANGELOG="CHANGELOG.md"

  NEW_VERSION=$(grep '^## ' ${CHANGELOG} | awk 'NR==1')
  LAST_VERSION=$(grep '^## ' ${CHANGELOG} | awk 'NR==2')

  DESCRIPTION=$(awk "/^${NEW_VERSION}$/,/^${LAST_VERSION}$/" ${CHANGELOG} | grep -v "^${LAST_VERSION}$")
  hub version
  hub release create v${VERSION} -m "Release ${VERSION}" -m "${DESCRIPTION}"
}

function release_cocoapods {
  git config user.name borgified
  git config user.email borgified@gmail.com
  git config remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
  git fetch --unshallow --tags
  git branch ${VERSION} v${VERSION}
  hub push origin ${VERSION}
  pod trunk push aBlinkingLabel.podspec --swift-version=3.0
}

function main {
  release_github
  release_cocoapods
}

main
