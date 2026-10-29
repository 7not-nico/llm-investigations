# Does the audit's early/late operator mechanism have a source?

**Concern:** the audit's mechanism section states specific layer bands — "early layers
(0–40%) parse operator syntax", "late layers (60–100%) process semantic meaning". Is
that a measurement?

**Status: NO. No verified source states those percentages. It is the audit's synthesis,
and it reads as a finding.**

## the claim

`../meta-audit.md`, "Mechanism underlying operator failures":

> 1. **Early layers** (0–40%): parse operator syntax → structural constraint mode
> 2. **Late layers** (60–100%): process semantic meaning → semantic constraint mode
>
> Modes compete for representational resources. Operator addition degrades operator
> parsing + semantic compliance.

The derived explanations that follow this all rest on the two bands: `∩` read as list
punctuation, `NOT` priming in semantic space, `XOR` dissociating, instruction-tuning
overwriting operator circuits.

## what the sources actually say

**`arXiv:2604.06015`** (Rocchetti & Ferrara) — the nearest source — states tasks
*"stratify by complexity across layers, with structural constraints emerging early and
semantic tasks emerging late."*

That is **directional**: early versus late. It names no percentages and draws no
boundary. Turning "early" into 0–40% and "late" into 60–100% is the audit's
interpolation, and the middle 20% is unaccounted for in the source's own terms.

**`arXiv:2605.03052`** (Zhou et al.) puts negation construction in **mid-layer**
attention and shortcut behaviour in **late-layer** attention, on Mistral-7B and
Llama-3.1-8B. Relative bands again, and relative to a different model family.

## why the interpolation matters

The percentage bands are doing argumentative work. "Modes compete for representational
resources" is a mechanism; the bands are what makes it look like a **quantity with a
measured boundary** — and a conflict is supposed to arise only if both modes need
capacity at once, which is most plausible exactly when the bands overlap or abut.

With no measured boundary, the competition story is a plausible hypothesis with a
diagram drawn around it. It may well be right. It is not established, and the audit
presents it in the voice of a finding while marking only its *source rows* with
confidence.

## the parallel in the sibling audit

This is the same shape as the negation layer story in
`../../llm-specification-gotcha-contraction/granular-investigation/do-middle-and-early-layers-disagree-about-negation.md`:
directional depth claims from different sources, merged into one depth narrative, then
quantified beyond what any of them state. Both audits do it, which suggests it is a
habit of the format rather than a slip in one place.

## what to do

Keep the direction (early structural, late semantic — sourced), drop the percentages,
and mark the competition claim as a hypothesis. The audit's per-operator findings do
not depend on the exact boundary: each row's verdict rests on its own measurement.

## related

- `which-model-and-layer-processes-negation.md` — the negation row's layer and model
- `../raw/operator-fidelity-papers.md` — full source table for this audit