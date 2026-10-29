# Do determiners recruit the most shared units?

**Concern:** the audit's tier-1 argument leans on determiner-noun agreement's 68.91%
overlap — the highest of the three agreement types — to conclude that determiners are
strongly represented, which bears on why a clause-initial `no X` escapes a
function-word detector. Does the number support that?

**Status: the number is real and correctly quoted. It measures a different quantity
than the argument needs, so the inference is a hypothesis, not a result.**

## the source

`arXiv:2512.03676` — *Different types of syntactic agreement recruit the same units
within large language models*, Kryvosheieva, Daria; de Varda, Andrea; Fedorenko,
Evelina; Tuckute, Greta. v1 2025-12-03, rev. 2026-04-11, cs.CL. PDF in `../raw/`.
Full text read with `pdftotext`; the passage below is from the Results.

## what the paper says, verbatim

> The results are shown in Figure 4: across most phenomena, the within-category
> overlaps are reliably higher than the cross-category overlaps (t = 2.07, p = 0.0312
> via a two-sample Welch t-test). Interestingly, this pattern appears to be driven by
> the three agreement categories: determiner-noun agreement, subject-verb agreement,
> and anaphor agreement (average **within-category** overlaps: **68.91%, 40.29%, and
> 23.10%**, respectively).

Separately: overlap **with other agreement phenomena** runs 15.26%–23.17%, against
5.72%–8.23% for non-agreement phenomena.

## the fault is the word "within"

The three figures are **within-category** overlaps — how much the same units recur
across instances of *one* agreement type. The audit's phrasing, "agreement categories
(subject-verb: 40.29%, anaphor: 23.10%, determiner-noun: 68.91%) recruit overlapping
units", reads as overlap *between* the categories. Different quantities.

The statistic that carries the paper's finding is the **within-versus-cross
contrast**, and the paper reports the three numbers as *drivers of* that contrast
(t = 2.07, p = 0.0312) — not as a ranking of agreement types by importance.

## why it matters for this argument

The inference being made is roughly: *determiners are represented most strongly, so
`no X` is processed by the strongest functional machinery, so a detector reading
function-word-initial clauses misses it in a principled way.*

That inference needs **cross-category** overlap — specifically, that determiner units
are shared with, or recruit, units serving other constructions. The paper measures
cross-category agreement overlap at **15.26%–23.17%**, a single pooled band, without
a per-type breakdown in the abstract or this passage.

So the strong reading is **not supported by this row**. It is not refuted either. The
paper is compatible with it. That makes it a probe worth running, not a citation to
lean on.

## what would settle it

Read the paper's per-type cross-category overlap matrix (Figures 3–4 and appendices)
for the determiner-noun category specifically. If determiner units overlap
substantially more with other categories than subject-verb units do, the audit's
inference is supported by data already collected. If the matrix pools them, the
inference needs a new measurement.

That is a read of an existing figure, not an experiment — cheap, and it either
upgrades the argument or downgrades it to a hypothesis.

## related

- `are-function-word-heads-a-general-llm-finding.md` — the other tier-1 row, whose
  subject is GPT-2 rather than LLMs
- `whose-paper-is-where-meaning-lives.md` — the attribution fault in the same table
- `../raw/function-word-and-agreement-papers.md` — full source table for this audit