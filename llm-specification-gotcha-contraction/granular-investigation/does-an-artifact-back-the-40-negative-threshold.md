# Does an artifact back the 40% negative threshold?

**Concern:** the gotcha tier cites a "Negative Instruction Cascade" (Zenodo 2025)
for a finding that **once negative restrictions exceed ~40% of instructions, models
break down**. Is there a paper behind it?

**Status: NO. There is no paper. The record is real; the artifact does not exist.**

## what was checked

DOI `10.5281/zenodo.18855895`, fetched via the Zenodo records API
(`https://zenodo.org/api/records/18855895`).

- title: *The Negative Instruction Cascade: An Empirical Analysis of LLM Prompt
  Engineering Failure Modes*
- creator: Hilliard, Matty (single author)
- publication date: 2025-03-03
- resource type: **Preprint**, self-published

## what the record actually contains

Two files. Both retrieved into `../raw/`.

| file | size | what it is |
|---|---|---|
| `zenodo-18855895-WhatweShould.txt` | 19,829 B | *"A Philosophical Rationalization: 'Not What We Shouldn't, Rather What We Should'"* — an essay arguing for affirmative design, with a conference-style abstract embedded near the end |
| `zenodo-18855895-MistralMemorySetting.txt` | 4,688 B | *"Matty Hilliard's Permanent Memory Rules for Mistral Chat (Positive Framing)"* — a personal system prompt: response-style modes, ✅/⚠️/🔄 compliance beacons, `/precise` and `/silent` shortcuts, a custom macro layer |

There is no PDF. No methods section. No data, no model runs, no sample size, no
statistic. Nothing in either file references the `v1.1 → v2.1 → v3.0` instruction
versions the Zenodo description says the analysis covers — searched, zero hits.

## where the title actually lives

The audit's cited title appears **inside the system-prompt file as a quoted string**.
That file opens by reporting that the file "The Negative Instruction Cascade: An
Empirical Analysis of LLM Prompt Engineering Failure Modes.txt" exists and begins as
follows, then pastes the supposed paper's abstract. The paper's entire content is
that pasted abstract, and it is being quoted as context inside a prompt.

## where the 40% actually lives

**Only in the Zenodo record's own metadata description.** Not in either deposited
file. Searching the deposited text for `40%`, `60%`, `threshold`, `n =`, `trials`,
and the version numbers returns no match for the threshold claim.

The deposited text carries a *different* set of numbers:

- 47% higher violation rate under negative framing
- 33% slower task completion
- 62% increase in clarifying questions
- "positive framing reduces violations by 40%"
- "symbolic reinforcement improves compliance by 28%"
- "shortcut commands reduce user frustration by 55%"
- a case study: "a 2024 study" with −43% task time, −60% frustration

Note the trap: there **is** a 40% in the deposited text — but it is a 40% *reduction
from positive framing*, not a 40% *threshold of negative instructions*. The audit's
phrasing reads as though it conflated the two.

## how I got here wrong, twice

Worth recording because the error shape recurs. First pass I recorded the citation
UNRESOLVED after searches surfaced nothing. A lane then resolved the DOI, and I
near-verified it on the strength of the record's abstract — which is exactly the
error the rest of this folder documents: **a record's metadata is not its content.**
Checking the deposited files, rather than the description of them, is what found it.

## what this does to the audit

The gotcha tier cites this as one of several convergent sources. It is not a source.
The row needs to be dropped, or replaced with a claim that has an artifact behind
it.

The inversion is worth stating plainly: **the tier that reads as most dangerous in
the audit is the tier with the weakest support in the folder.** The best-evidenced
claim (token bans, n=40,000, causally patched) has the wrong scope; the
in-scope claim (this one) has no artifact.

## related

- `does-priming-evidence-transfer-to-output-shape-prohibitions.md` — the scope
  problem with the one paper that does measure this
- `../raw/negative-constraint-papers.md` — full source table for this audit