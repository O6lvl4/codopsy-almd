# codopsy-almd

Structural complexity for [Almide](https://github.com/almide/almide), measured
from [gramide](https://github.com/O6lvl4/gramide)'s parse of Almide rather than
from a grammar written for another language.

```sh
almide build
./codopsy_almd src/
```

```
src/main.almd:  max 9 in main (L114), total 31 over 6 function(s), 152 lines
src/tree.almd:  max 6 in span_end (L24), total 19 over 6 function(s), 112 lines
```

## The rule that made it worth writing

**A file that was not fully parsed is not graded.**

The measurements that prompted this tool were taken from an analyzer that read
Almide through a grammar it did not fully support, and nothing in the output
said so. Two numbers carried the whole comparison: a file called the worst of
its set at 40, graded on 58% of itself with three of its functions seen — a
complete parse put it second best at 11 — and a file graded A on 10.2% of its
contents.

So the first thing reported is not a score:

```
query.almd: NOT GRADED — gramide could not parse all of it
```

`--incomplete` grades it anyway and says what the number is worth:

```
query.almd: max 7 in function #6, total 26 over 8 function(s)  [PARTIAL PARSE — every count below is a floor]
```

## What it counts

A function's complexity is 1 + its decision points: every `if`, every
`match_arm` past the first of its `match` (a two-armed match is one decision),
every `while`, every `for`, every `guard`.

`gramide symbols` supplies `complete` and the function names in source order;
`gramide parse` supplies the tree. The Nth `function_declaration` in the tree is
the Nth symbol, and a count mismatch is reported rather than assumed away.

## Options

| Option | |
|---|---|
| `--json` | machine-readable results |
| `--incomplete` | grade partially-parsed files, marked as floors |
| `--max N` | exit 1 if any function is more complex than N |

## Status

Experimental, and only Almide. gramide is the parser, so the languages it could
grow to cover are the ones gramide covers.

## License

MIT or Apache-2.0, at your option.
