# Whose paper is "Where meaning lives"?

**Concern:** the audit's source table attributes *"Where meaning lives: Layer-wise
accessibility"* to **Skean et al.** Does that paper have those authors?

**Status: NO. The attribution is wrong. The audit merged one paper's title and
finding with a different paper's authors.**

## the row

```
| *Where meaning lives: Layer-wise accessibility* | Findings ACL 2026 | Skean et al. |
  Lexical properties peak early; affective/semantic in middle. Final layer never
  optimal. Depth ordering shared across architectures. |
```

## what each half resolves to

**By title** — `arXiv:2601.03798`, *Where meaning lives: Layer-wise accessibility of
psycholinguistic features in encoder and decoder language models*, by **Tikhomirova,
Taisiia; Wulff, Dirk U.**, 2026-01-07. PDF in `../raw/`.

**By authors** — `arXiv:2502.02013`, *Layer by Layer: Uncovering Hidden
Representations in Language Models*, by **Skean, Oscar; Arefin, Md Rifat; Zhao, Dan;
Patel, Niket Naghi**. PDF in `../raw/`, deposited so the two can be compared.

Two distinct works. The audit's row takes the title and the finding from the first and
the author list from the second.

## the finding survives

Tikhomirova & Wulff do report what the audit's finding column says: lexical properties
become accessible early, affective and semantic properties in the middle, and the
final layer is rarely optimal for psycholinguistic features — with depth ordering
shared across encoder and decoder architectures.

So this is an **attribution fault, not a content fault.** The row's claim is
supported; its address is wrong.

## why this one is worth a file

An attribution error is normally cheap: the reader follows the citation, finds a
different paper, loses a minute. This one is not, for two reasons.

First, the misattributed paper (Skean et al.) is a **real, plausible, on-topic paper**
about hidden representations in language models. A reader who checks will not find an
error — they will find a paper that looks like it should be the source and is not.

Second, it is the third instance in these three audits of the same failure mode:
**a row borrowing another source's authority.** The operator audit's negation row names
a model family no source tested. The gotcha audit cites a Zenodo record that deposits
no paper. Here the finding is intact and only the author is wrong — which is the
subtlest form, because there is nothing visibly broken to find.

## what to do

Change the author cell to **Tikhomirova & Wulff**, keep the finding, and keep the arXiv
ID in the citation. The venue "Findings ACL 2026" is not confirmed from the abs page —
treat it as unverified until a proceedings record is found.

## related

- `do-determiners-recruit-the-most-shared-units.md` — the adjacent tier-1 row, whose
  numbers are real but measure something else
- `are-function-word-heads-a-general-llm-finding.md` — the other tier-1 row
- `../raw/function-word-and-agreement-papers.md` — full source table for this audit