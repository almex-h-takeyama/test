#!/bin/sh

set -eu
RESULT=$(git-pr-release --squashed)
echo "$RESULT"

PR_URL=$(echo $RESULT | sed -r 's#(.*)(https://github.com/.*/pull/[0-9])#\2#')
echo "pr_url: $PR_URL"
echo "::set-output name=pr_url::$PR_URL"
