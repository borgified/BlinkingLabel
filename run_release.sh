#!/usr/bin/env bash
set -e


# Needs COCOAPODS_TRUNK_TOKEN defined in job settings

pod trunk push --allow-warnings
