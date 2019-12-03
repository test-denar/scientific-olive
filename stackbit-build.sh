#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://stg-api.stackbit.com/project/5de6788f7f1d1d001277307e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://stg-api.stackbit.com/pull/5de6788f7f1d1d001277307e
curl -s -X POST https://stg-api.stackbit.com/project/5de6788f7f1d1d001277307e/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://stg-api.stackbit.com/project/5de6788f7f1d1d001277307e/webhook/build/publish > /dev/null
