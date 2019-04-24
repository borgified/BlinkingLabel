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


MYREPO=${HOME}/workdir/${TRAVIS_REPO_SLUG}
AUTOBRANCH=${GITHUB_USER}/prepareRelease${VERSION}

function prep_workspace {
  rm -rf ${MYREPO}
  mkdir -p ${MYREPO}
  git clone -b ${TRAVIS_BRANCH} https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG} ${MYREPO}
}


function release_cocoapods {
  cd ${MYREPO}
  git branch ${VERSION} v${VERSION}
  git push origin ${VERSION}
  pod trunk push aBlinkingLabel.podspec --swift-version=3.0
}

function main {
  release_github
  prep_workspace
  release_cocoapods
}

main
