# Are function-word heads a general LLM finding, or a GPT-2 result?

**Concern:** the audit's tier-1 core states "Function words (DET, ADP, CCONJ, SCONJ,
AUX): specialized heads in layers 3–4 (ACL 2026)". Which models does that hold for?

**Status: the claim is accurate and precisely stated in the source — and the source's
subject is GPT-2 variants trained on counterfactual corpora, not LLMs generally.**

## the source

`arXiv:2601.21191` — *Function Words as Statistical Cues for Language Learning*,
Yang, Xiulin; Getz, Heidi; Wilcox, Ethan Gotlieb. v1 2026-01-29, rev. 2026-04-20,
cs.CL, **Comments: ACL 2026**. PDF in `../raw/`.

## what the paper does

Three parts, and the third is the one the audit cites:

1. **Cross-linguistic corpus analysis of 186 languages**, confirming three
   distributional properties of function words are universal: high frequency, reliable
   syntactic association, phrase-boundary alignment.
2. **Counterfactual language modeling + ablation on English**, establishing a
   **Goldilocks effect** — function words must be frequent enough to be reliable yet
   diverse enough to remain informative to structural dependency.
3. **Attention probing and function-word ablation**, the RQ3 results.

The RQ3 result, from the full text:

> Models trained with **NATURALFUNCTION** exhibit a highly concentrated pattern of
> function word attention: a small number of heads, **primarily in Layers 3 and 4**,
> account for the majority of function word attention across BLiMP categories. This
> pattern indicates the emergence of specialized representations tied to function words
> when all three distributional properties are present.

Conditions disrupting any of the three properties — `RANDOMDEP`, `BIGRAMDEP`,
`WITHINBOUNDARY` — fail to produce the concentrated pattern. Models trained without
function words are excluded from the analysis.

## two scope facts the audit drops

**The models are GPT-2 variants**, trained on the paper's own counterfactual language
variants. Not the seven open-weight models in the sibling agreement paper, and not a
modern LLM. The paper does use BERT in separate experiments, but the layer-3/4 result
is the GPT-2 probing run.

**The heads are conditional on the corpus.** The paper's own conclusion: *"Disrupting
any of the three properties prevents the emergence of focused function word attention
heads."* So "function words get dedicated heads in layers 3–4" is a statement about a
learner trained on a well-formed corpus, with the counterfactual arms as the control
that establishes the condition.

## why the narrower subject is the more interesting claim

The conditional form is the finding, not a caveat on it. The paper is not reporting
that function words are represented in layers 3–4 — it is reporting that **the corpus's
distributional properties cause that representation to emerge**, demonstrated by
building languages where the properties are absent and watching the heads fail to
concentrate.

That is a stronger claim than the audit uses it for, and it is also a *different kind*
of claim from what the audit's tier table rests on. See the next note.

## how I got this wrong first

Abstract-only checking found no layer numbers, no attention heads, and a
corpus-statistics framing — and I recorded the audit's row as REFUTED. That was wrong.
The claim is stated nearly verbatim in the Results. The lesson is specific: a paper
whose headline contribution is a corpus analysis can bury a mechanistic result in
RQ3, and an abstract that omits it is not evidence of absence.

## what to do

Keep the row, and qualify the subject: GPT-2 variants trained on controlled corpora,
with the heads emerging as a function of the corpus's distributional properties.
Attribute the conditional to the paper rather than restating it as unconditional.

## related

- `do-the-two-function-word-findings-measure-the-same-thing.md` — why the corpus
  result and the head result cannot be stacked into one mechanism
- `do-determiners-recruit-the-most-shared-units.md` — the adjacent tier-1 row
- `../raw/function-word-and-agreement-papers.md` — full source table for this audit