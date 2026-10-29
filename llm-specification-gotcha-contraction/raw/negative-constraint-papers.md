# Negative-constraint papers — resolved against primary sources

**Date:** 2026-10-01
**Subject:** the papers behind the gotcha / contraction tiers of `../meta-audit.md`
**Method:** `curl` on `arxiv.org/abs/<id>`, metadata read from `citation_title` /
`citation_author` / `citation_date` / `citation_abstract` meta tags; ACL Anthology
records read from the embedded BibTeX. Every claim below is checked against the
paper's own abstract text, not against a search snippet.

## Queries

1. `Semantic Gravity Wells arXiv 2601.08070 negative constraint priming`
2. `Don't think of the white bear ironic rebound arXiv 2511.12381`
3. `imperative declarative register cross-lingually arXiv 2603.25015 Mason`
4. `Rocchetti Ferrara skill coordination constraint following arXiv 2604.06015`
5. `"Negative Instruction Cascade" Zenodo 2025 threshold`

## Sources Fetched

| Source | Institution | Type | Key Content |
|--------|-------------|------|-------------|
| arXiv:2601.08070 — *Semantic Gravity Wells: Why Negative Constraints Backfire* | Rana, Shailesh (single author) | paper, cs.AI | 2026-01-12, 10pp/8 figures. `p = σ(-2.40 + 2.27·P₀)`, n=40,000, slope CI [2.21, 2.33]. Suppression present but weaker in failures: −5.2pp vs −22.8pp (4.4× asymmetry). Priming failure 87.5% of violations; override failure 12.5% with +0.39 late-layer FFN. Layers 23–27 causally responsible by activation patching. |
| arXiv:2511.12381 — *Don't Think of the White Bear: Ironic Negation in Transformer Models Under Cognitive Load* | Mann, Saxena, Tandon, Sun, Soteja, Zhu | paper, cs | 2025-11-15. Rebound arises immediately after negation, intensifies with longer/semantic distractors, repetition supports suppression. Stronger polarity separation ⇒ more persistent rebound. Circuit tracing finds sparse **middle-layer** heads amplifying forbidden tokens while **early** layers suppress. Releases ReboundBench, 5,000 negation prompts. |
| arXiv:2603.25015 — *Imperative Interference: Social Register Shapes Instruction Topology in Large Language Models* | Mason, Tony (single author) | paper, cs.CL/cs.AI/cs.SE | 2026-03-26. Instruction-level ablation across 4 languages × 4 models. English imperative cooperates, Spanish imperative competes. Declarative rewriting of one block cuts cross-linguistic variance **81%** (p=0.029, permutation test). Rewriting 3 of 11 imperative blocks flips Spanish topology cooperative, with spillover. Framing: `"NEVER do X"` is an exercise of authority, `"X: disabled"` is a factual description that transfers. 22 probes against a 56-block production system prompt. |
| arXiv:2604.06015 — *How LLMs Follow Instructions: Skillful Coordination, Not a Universal Mechanism* | Rocchetti, Elisabetta; Ferrara, Alfio | paper, cs | 2026-04-07, rev. 2026-09-10. Nine tasks, three instruction-tuned models. General probes show selective not uniform deficits; cross-task transfer weak and clustered by skill similarity; causal ablation shows sparse asymmetric dependencies. "Tasks stratify by complexity across layers, with structural constraints emerging early and semantic tasks emerging late." Constraint signal decodable only once generation is underway. |
| DOI 10.5281/zenodo.18855895 — *The Negative Instruction Cascade: An Empirical Analysis of LLM Prompt Engineering Failure Modes* | Hilliard, Matty (single author) | **preprint, self-published** | 2025-03-03. Three JSON-instruction versions (v1.1 → v2.1 → v3.0); Claude identified a **~40%** negative-restriction threshold for breakdown behaviour, **>60%** static loops "inevitable". Recommends ≥3:1 positive-to-negative. PDF in this folder. |

## Verification verdict

**VERIFIED — `Semantic Gravity Wells`, and its scope is narrower than this audit uses it.**

The paper's own first sentence defines its intervention: *"Negative constraints
(instructions of the form 'do not use word X')"*. Every number in it — the
logistic fit, the 4.4× suppression asymmetry, the 87.5/12.5 split, layers 23–27 —
is measured on **token-level bans**, where the forbidden item is a specific token
whose probability is well defined.

This audit generalizes the 87.5% priming figure to behavioural/style prohibitions
("Don't be verbose") and to the contraction tier generally. The paper does not
support that transfer: its mechanism is that *naming a forbidden word activates it*,
which is a claim about the referent being a word. An instruction forbidding an
output **shape** (`no summary`, `no invented files`) does not name a token, so the
mechanism is not the same operation. The figure is real and the generalization is a
separate claim needing its own evidence.

**VERIFIED — `Don't Think of the White Bear`.** Circuit result matches: sparse
middle-layer amplification against early-layer suppression. Note this is a
different model family and layer window from Semantic Gravity Wells' layers 23–27,
so the two papers' layer numbers should not be merged into one claim.

**VERIFIED — `Imperative Interference`.** The 81% figure, the English/Spanish
inversion, and the `"X: disabled"` mitigation form are all in the abstract. This is
the load-bearing source for a declarative rewrite as mitigation, and it measures
**register across languages** — not prohibition strength.

**VERIFIED — `Skillful Coordination`.** Confirms the early-structural / late-semantic
split this audit's tier table rests on.

**REFUTED AS CITED — `Negative Instruction Cascade` is not a paper.** My first two
passes on this got it wrong in opposite directions: I recorded it UNRESOLVED, then
near-verified it on the strength of its Zenodo abstract. Both were mistakes, and
the correction is the substantive finding here.

The record exists — DOI `10.5281/zenodo.18855895`, "The Negative Instruction
Cascade: An Empirical Analysis of LLM Prompt Engineering Failure Modes", Hilliard,
Matty, 2025-03-03, resource type **Preprint**, self-published. But **it contains no
paper.** The record deposits exactly two files, both retrieved into this folder:

| file | size | what it actually is |
|---|---|---|
| `zenodo-18855895-WhatweShould.txt` | 19,829 B | *"A Philosophical Rationalization: 'Not What We Shouldn't, Rather What We Should'"* — an essay on affirmative design, with an embedded conference-style abstract |
| `zenodo-18855895-MistralMemorySetting.txt` | 4,688 B | *"Matty Hilliard's Permanent Memory Rules for Mistral Chat (Positive Framing)"* — a personal system prompt of beacons, `/precise` and `/silent` shortcuts, a custom macro layer |

There is no PDF, no methods section, no data, no model runs, no sample size, and no
reference anywhere in either file to the "v1.1 -> v2.1 -> v3.0" instruction versions
the Zenodo description says the analysis covers. The title this audit cites exists as
a **quoted string** inside the system-prompt file: that file opens by reporting that
the file "The Negative Instruction Cascade: An Empirical Analysis of LLM Prompt
Engineering Failure Modes.txt" exists and begins as follows, then pastes the supposed
paper's abstract. The paper's entire content is that pasted abstract.

**The audit's number is not in the artifact.** The ">40% negative threshold ->
breakdown" claim appears **only in the Zenodo record's own metadata description**.
The deposited text carries a *different* set of figures, none of which is a
threshold: 47% higher violation rate under negative framing, 33% slower task
completion, 62% more clarifying questions, and separately "positive framing reduces
violations by 40%". A 40% in metadata and a 40% *reduction* in the essay are easy to
conflate, and the audit's phrasing reads as though it did.

So the source is real, the title is real, the author is real, and the threshold
claim has **no artifact behind it**. That is not weak evidence — it is the absence
of evidence carrying a citation, and the audit cites it as one of several convergent
sources for the tier.

## Open divergence

Three of the four arXiv papers locate the failure mechanism in **middle or late**
layers; the audit's own tier table is built on an early/late split sourced from
Rocchetti & Ferrara, which is about *constraint type*, not about prohibition. Two
different things are being layered here — constraint processing depth and negation
processing depth — and they should be cited as two claims, not one.

There is a **strength inversion across the gotcha tier's own sources**: the
best-evidenced claim in this folder (token-level bans, n=40,000 samples with a
bootstrap CI, mechanistic, causally patched) is the one whose scope does *not*
reach style prohibitions, while the claim that *does* cover the audit's behavioural
tier is a metadata string with no artifact behind it. **The tier that reads as most
dangerous in the audit is the tier with the weakest support in the folder.**

This is the third time in this session that a source's *plausibility* was mistaken
for its *content*: Semantic Gravity Wells' 87.5% transposed from tokens onto output
shapes, the Gemma-2-27B negation row, and now this. A citation that arrives without
a resolvable artifact is not a source — and a table shaped as `paper | venue |
finding` renders an empty row identically to a full one, so nothing in the audit's
layout signals the difference.