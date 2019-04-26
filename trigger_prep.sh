#!/usr/bin/env bash
set -e

# needs $GITHUB_TOKEN set

# usage: ./trigger_prep.sh <branch>
# if <branch> not specified, defaults to "master"


BRANCH=${1:-master}
REPO_SLUG=borgified%2FBlinkingLabel

travis login --org --github-token $GITHUB_TOKEN
TRAVIS_TOKEN=$(travis token --no-interactive)

body='{
  "request": {
    "message": "Manually triggered prep stage.",
    "branch": "'${BRANCH}'",
    "config": {
      "env": {
        "HUB": "true"
      }
    }
  }
}'

curl -s -X POST \
   -H "Content-Type: application/json" \
   -H "Accept: application/json" \
   -H "Travis-API-Version: 3" \
   -H "Authorization: token $TRAVIS_TOKEN" \
   -d "$body" \
   https://api.travis-ci.org/repo/${REPO_SLUG}/requests
