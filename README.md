# llm-investigations

Four LLM investigations: item omission, operator meta-audit, semantic weight, and
specification gotcha contraction. Each is a self-contained folder with its
meta-audit, granular investigations, schema, and raw sources. Raw PDFs are not
included in the repo — each investigation's `raw/*-papers.md` carries the
official and original links for every source.

## Investigations

- [llm-item-omission](llm-item-omission/) — which item kind gets dropped, and
  whether the corpus can say so
- [llm-operator-meta-audit](llm-operator-meta-audit/) — early/late operator
  mechanism, instruction tuning, token reduction, negation processing
- [llm-semantic-weight](llm-semantic-weight/) — function-word heads, determiner
  recruitment, where meaning lives
- [llm-specification-gotcha-contraction](llm-specification-gotcha-contraction/) —
  middle vs early layer negation, declarative rewrites, the 40% negative
  threshold, priming evidence and output shape

## Structure (each investigation)

```
meta-audit.md                 # synthesis and verdict
granular-investigation/       # per-question writeups
raw/                          # source notes + *-papers.md (links, not PDFs)
_schema/                      # db.sql + seed.sql (where present)
```

## Pages

Rendered site: https://7not-nico.github.io/llm-investigations/
