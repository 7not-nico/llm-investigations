# Which model and layer processes negation?

**Concern:** `../meta-audit.md` lines 190–196 state "Layer 10 :: Gemma-2-27B negation
operator", with ablation collapsing downstream representations ~40%, attributed to
"Zhou et al., ICML 2026". Does a paper support that row?

**Status: NO. Every element of the row is unattributable as written. The matching
paper tests different models, and neither the layer number nor the percentage is in
it.**

## the row, verbatim from the audit

```
- Layer 10 :: Gemma-2-27B negation operator
- Acts as causal trigger → ablating it collapses downstream representations ~40%
- Construction mechanism dominates: mid-layer attention builds ¬Y representation
- Suppression coexists, weaker
- Late-layer shortcut h...
```

The third and fourth bullets match a real paper. The first, second and model name do
not.

## what the matching paper is

`arXiv:2605.03052` — *How Language Models Process Negation*, Zhou, Zhejian; Zhou,
Tianyi; Jia, Robin; May, Jonathan, 2026-05-04, rev. 2026-05-29, cs.CL. PDF in
`../raw/`. Verified by curl against the arXiv `citation_author` and `citation_abstract`
meta tags.

Its abstract states:

> We apply a range of observational and causal interpretability techniques on
> **Mistral-7B and Llama-3.1-8B** to show that models implement both mechanisms, with
> the "constructive" mechanism being more prominent.

And, on the failure side:

> Their poor accuracy is due to **late-layer attention behavior that promotes simple
> shortcuts**; ablating those attention modules greatly improves accuracy.

## element by element

| audit's row | paper | verdict |
|---|---|---|
| construction mechanism dominates | "construction being more prominent" | **supported** |
| suppression coexists, weaker | both mechanisms, construction more prominent | **supported** |
| late-layer shortcut | late-layer attention promotes shortcuts | **supported** |
| Gemma-2-27B | Mistral-7B, Llama-3.1-8B | **refuted** |
| Layer 10 | not in abstract | **unattributed** |
| ~40% collapse on ablation | not in abstract; the paper reports *improved accuracy* | **unattributed, and stated as the wrong kind of quantity** |

## the compound error

Three separate faults stacked in one row:

1. a **different model family** named than the one measured
2. a **layer number** with no source
3. a **percentage of representation collapse** substituted for the paper's actual
   finding, which is an *accuracy improvement* after ablation

Fault 3 is the one worth dwelling on. "Collapses downstream representations ~40%" and
"greatly improves accuracy" are opposite-signed claims about what ablation does.
The first says the circuit is load-bearing; the second says removing a shortcut
helps. A row that inverts the sign of its source is not a citation error that a
reader can catch by checking the venue.

## what to do

Either locate a Gemma-2-27B paper and cite it for the layer-10/40% row, or rewrite
the row to the Mistral/Llama result: construction-dominant negation in mid-layer
attention, with late-layer shortcut attention causing the errors. The second is
supported and the audit's argument survives on it — the audit's mechanism section
does not need Gemma or layer 10.

## related

- `../raw/operator-fidelity-papers.md` — full source table for this audit
- `../../llm-specification-gotcha-contraction/granular-investigation/do-middle-and-early-layers-disagree-about-negation.md`
  — why layer numbers cannot be quoted without their model family