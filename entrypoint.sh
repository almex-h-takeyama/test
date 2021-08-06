#!/bin/sh

set -eu
git-pr-release --squashed 2>&1 | tee result.txt

PR_URL=$(grep -E "https://github.com/(.*)/pull/(.*)" result.txt | sed -r 's#^(.*)(https://github.com/.*/pull/[0-9]*)(.*)$#\2#')
echo "pr_url: $PR_URL"
echo "::set-output name=pr_url::$PR_URL"
