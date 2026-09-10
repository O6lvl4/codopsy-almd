# codopsy-almd

An experimental structural analyzer for Almide, written in Almide, measuring
from gramide's parse of the language rather than from a grammar written for
something else.

## Why it exists

A structural number is only worth as much as the parse it was taken from. The
measurements that prompted this tool were read off files that the analyzer had
only partly parsed: one file was graded on 58% of itself with three of its
functions seen, and was reported as the worst of a set when a complete parse put
it second best. Another was graded an A on 10.2% of its contents.

So the first thing this tool reports is not a score. It is whether the file was
parsed at all, and a file that was not is not graded.

## How it measures

* `gramide symbols` gives `complete`, the file's line count, and every
  function's name and line range.
* `gramide parse` gives the tree. Its `function_declaration` nodes appear in
  source order, so the Nth pairs with the Nth symbol.
* A function's complexity is 1 + its decision points: every `if`, every
  `match_arm` past the first of its `match`, every `while`, every `for`, every
  `guard`.

Reported per file: whether the parse was complete, the maximum complexity over
its functions, the total, and the functions that carry it.
