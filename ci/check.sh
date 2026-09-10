#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler="${ALMIDE_BIN:-almide}"
"$compiler" test
"$compiler" build

# The tool measures itself, from the build just made rather than whatever is on
# PATH. The baseline is per file, so a clean file cannot rot up to the worst
# one. It is only ever allowed to go down; --write-baseline records a fall.
# It has already earned its place twice: --quiet took main from 15 to 17 and
# --baseline took it from 8 to 13, and both times main was split rather than
# the number raised.
./codopsy_almd --quiet --baseline .codopsy-almd.json src/
