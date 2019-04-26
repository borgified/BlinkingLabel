#!/usr/bin/env bash
set -e

# needs $GITHUB_TOKEN set

BRANCH=master
REPO_SLUG=borgified%2FBlinkingLabel

travis login --org --github-token $GITHUB_TOKEN
TRAVIS_TOKEN=$(travis token --no-interactive)

body='{
 "request": {
 "message": "Manually triggered prep stage.",
 "branch": "'${BRANCH}'",
 "config": {
   "merge_mode": "deep_merge",
   "env": {
     "global" : {
     "HUB": "true",
     "VAR1": "hi",
     "VAR2": "hello"
   }
   }
  }
}}'

curl -s -X POST \
   -H "Content-Type: application/json" \
   -H "Accept: application/json" \
   -H "Travis-API-Version: 3" \
   -H "Authorization: token $TRAVIS_TOKEN" \
   -d "$body" \
   https://api.travis-ci.org/repo/${REPO_SLUG}/requests
