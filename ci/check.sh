#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler="${ALMIDE_BIN:-almide}"
"$compiler" test
"$compiler" build

# The tool measures itself, from the build just made rather than whatever is on
# PATH. A ratchet, not a target: it is only ever allowed to go down. It has
# already earned its place — adding --quiet took main from 15 to 17, this
# failed, and main was split rather than the number raised.
./codopsy_almd --quiet --max 8 src/
