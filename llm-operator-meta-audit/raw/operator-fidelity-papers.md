# Operator-fidelity papers — resolved against primary sources

**Date:** 2026-10-01
**Subject:** the papers behind the operator rows of `../meta-audit.md`
**Method:** `curl` on `arxiv.org/abs/<id>`, metadata read from the `citation_*`
meta tags. Claims checked against each paper's own abstract text.

## Queries

1. `MetaGlyph symbolic instruction language arXiv 2601.07354 van Gassen`
2. `How Language Models Process Negation arXiv 2605.03052 construction suppression`
3. `imperative register cross-lingually cooperative competitive arXiv 2026`
4. `Skillful Coordination Not a Universal Mechanism arXiv 2604.06015`
5. `Semantic Gravity Wells arXiv 2601.08070`

## Sources Fetched

| Source | Institution | Type | Key Content |
|--------|-------------|------|-------------|
| arXiv:2601.07354 — *Semantic Compression of LLM Instructions via Symbolic Metalanguages* (MetaGlyph) | van Gassen, Ernst (single author, Independent Researcher) | paper | 2026-01-12. Eight models, 3B–1T, open + proprietary. 62–81% token reduction across task types. Operator fidelity table: `∈` Llama-3B 33.3%, Qwen-7B 20.4%, OLMo-7B 0.0%, Gemma-12B 0.0%, Kimi K2 36.0%, Gemini 2.5 Flash 49.9%, Claude Haiku 4.5 26.0%, GPT-5.2 Chat 91.3%. `∩` 0.0% except Gemini 2.7% / Claude 1.5% / GPT 21.4%. `⇒` Kimi K2 98.1%, others 0–33.5%. Control NL=CTRL 0% everywhere. Reads the 7B–12B collapse as a U-shape: instruction tuning creates natural-language bias that scale eventually overcomes. |
| arXiv:2605.03052 — *How Language Models Process Negation* | Zhou, Zhejian; Zhou, Tianyi; Jia, Robin; May, Jonathan | paper, cs.CL | 2026-05-04, rev. 2026-05-29. **Models: Mistral-7B and Llama-3.1-8B.** Two hypotheses tested — suppression of the negated concept vs. construction of a ¬Y representation. Both mechanisms present, **construction more prominent**. Late-layer shortcut attention causes the wrong answers; ablating those modules greatly improves negation accuracy. Construction-dominant computation. |
| arXiv:2603.25015 — *Imperative Interference* | Mason, Tony | paper, cs.CL | 2026-03-26. See `../../llm-specification-gotcha-contraction/raw/negative-constraint-papers.md`. 81% variance reduction from declarative rewriting; register mediates instruction topology. |
| arXiv:2601.08070 — *Semantic Gravity Wells* | Rana, Shailesh | paper, cs.AI | 2026-01-12. Scope is token-level bans. See the gotcha-contraction note. |
| arXiv:2604.06015 — *Skillful Coordination* | Rocchetti; Ferrara | paper, cs | 2026-04-07. Structural constraints early, semantic late; no universal constraint mechanism. |
| arXiv:2604.13065 — *Correct Chains, Wrong Answers: Dissociating Reasoning from Output in LLM Logic* | Rao, Abinav; Rachuri, Sujan; Vemuri, Nikhil | paper, cs | 2026-03-19. At Claude Sonnet 4 depth 7, **all 31 errors** show correct reasoning with a wrong declared answer — the audit's "100% of depth-7 errors" is exact. |
| arXiv:2604.20564 — *Where Reasoning Breaks: Logic-Aware Path Selection by Controlling Logical Connectives in LLMs Reasoning Chains* | Park, Seunghyun; Lei, Yuanyuan | paper, cs | 2026-04-22. The **41.1%** connective-fragility figure is in the body, not the abstract — reported as an asymmetry between high-fragility and low-fragility connectives. |
| arXiv:2604.07192 — *Compact Constraint Encoding for LLM Code Generation: An Empirical Study of Token Economics and Constraint Compliance* | Tang, Hanzhang (single author) | paper, cs | 2026-04-08. Cliff's delta < 0.01 on constraint-satisfaction rate — token reduction buys no compliance. **Subject is constraint headers in code generation, not logical operators.** |
| OpenReview `e6NTBCmikA` — *A Study on the Reasoning Ability of LLMs Using Negation Principles in Chinese Sentences* | Li, Ran; Fan, Lingxiang; Ze, Gan; et al. | preprint, **AAAI 2026 Bridge workshop (LMReasoning)** | Chinese negation; the abstract names intuitionistic/minimal negation. Preprint-only and workshop track — not the main AAAI venue the audit's row implies. |

## Verification verdict

**VERIFIED — `MetaGlyph` attribution and every operator number in the audit's
fundamentals table.** `van Gassen, 2026` resolves; the `∩` 0–21% range, the 0%
membership fidelity for OLMo-7B / Gemma-12B, and the 33.3% Llama-3B baseline all
appear in the paper. The audit's "instruction-tuning degrades operator
comprehension (mid-sized IT 7–12B: 0% vs base 3B: 33%)" is a fair reading — with
one correction: the paper frames it as **non-monotonic**, not monotonic degradation.
It reports a U-shape where frontier scale recovers fidelity. Read as "bigger is
better" the claim is wrong; read as "small instruction-tuned models are worst" it
holds.

**REFUTED — the audit's model and layer attribution for negation circuits.**
`meta-audit.md:190-196` states *"Layer 10 :: Gemma-2-27B negation operator"*, an
ablation collapsing downstream representations ~40%, and cites "Zhou et al., ICML
2026". The paper that matches the construction-vs-suppression description is
arXiv:2605.03052, and it tests **Mistral-7B and Llama-3.1-8B** — not Gemma-2-27B.
Neither the layer number nor the ~40% figure appears in its abstract. Either a
different paper is meant, or the row conflates two sources. Until a Gemma paper is
located, the Gemma/layer-10/40% row has no support.

**VERIFIED with a scope caveat — the negation verdict.** The audit's *mitigation*
("use `X: disabled` instead of `do not X`") is supported by Mason's register
finding, not by the negation mechanism. MetaGlyph shows `X: disabled`-style
declarative notation has its own measured fidelity spread (26%–91% on `∈`), so the
mitigation is a register change with a cost, not a free substitution.

**CARRIED, NOT INDEPENDENT — the 87.5% priming row.** This audit's fundamentals
table cites Semantic Gravity Wells for "priming is the dominant negation failure
mode" at the operator level (`NOT / ! / ¬`). The paper measures token bans. An
operator-level verdict needs its own measurement; see the scope note in the
gotcha-contraction raw folder, where the artifact itself is also checked.

**VERIFIED — `Rao et al.`** (arXiv:2604.13065). "100% of depth-7 errors have correct
CoT but wrong declared answer" is exact: all 31 errors at Claude Sonnet 4 depth 7.
This is the strongest single-paper row in the fundamentals table.

**VERIFIED — `Park & Lei`** (arXiv:2604.20564). The 41.1% fragility figure is real
but lives in the body rather than the abstract, and it is reported as an asymmetry
between high- and low-fragility connectives — so "one connective change derails 41%
of correct chains" is a reasonable compression of a weaker statistic than it reads
as. Fine as written.

**VERIFIED — `Jiang et al.`** (DOI `10.18653/v1/2026.acl-long.808`, *Immediate
Inference: The Missing Foundation in Large Language Model Logical Reasoning*, ACL
2026 Long). The abstract states it verbatim: models "lack robust operator grounding,
oscillating between structural reasoning and surface pattern matching".

**OVERSTATED — `Tang (2026)` as the operator-benefit verdict.** The Cliff's δ < 0.01
result is real, but the paper studies **compact constraint headers for code
generation**, not logical operators. The audit's row "Token reduction is the ONLY
proven operator benefit" cites it as operator evidence; it is constraint-encoding
evidence. The conclusion happens to be compatible — MetaGlyph measures the same
non-effect on operators, at 62–81% reduction — but the citation does not support the
claim it is attached to.

**VERIFIED, VENUE CORRECTED — `Li et al.` on Chinese negation.** The paper is *A
Study on the Reasoning Ability of LLMs Using Negation Principles in Chinese Sentences*
(Ran Li, Lingxiang Fan, Gan Ze, Zhaoyang et al.), available only as OpenReview
`e6NTBCmikA`, and it is an **AAAI 2026 Bridge workshop** paper, not the main track.
The intuitionistic/minimal-negation claim is in its abstract. A workshop preprint is
thin support for a row the audit marks High confidence.

## Open divergence

The audit's mechanism section ("early layers 0–40% parse operator syntax, late
layers 60–100% process semantics") is a synthesis across sources, and no single
verified paper states those percentages. Treat the band split as the audit's model
of the evidence, not as a measured finding.