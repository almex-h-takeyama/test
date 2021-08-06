#!/bin/sh

set -eu
git-pr-release --squashed > result.txt 2>&1
cat -A result.txt

PR_URL=$(cat result.txt | sed "s/^[\[[0-9;]*m//g" | grep -E "https://github.com/(.*)/pull/(.*)"  | sed -r 's#(.*)(https://github.com/.*/pull/[0-9])#\2#')
echo "pr_url: $PR_URL"
echo "::set-output name=pr_url::$PR_URL"


# cat result.txt | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | sed -r 's#(.*)(https://github.com/.*/pull/[0-9]*)#\2#'
