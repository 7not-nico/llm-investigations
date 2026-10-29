# Is instruction tuning a monotone harm to operator fidelity?

**Concern:** the audit's fundamentals table states "Instruction-tuning destroys
operator comprehension: MetaGlyph mid-sized IT models (7–12B): 0% fidelity vs base
(3B): 33%". Does the source support a monotone claim?

**Status: NO — the relationship is explicitly non-monotonic, and the audit drops
the half of the finding that reverses the conclusion.**

## the source

`arXiv:2601.07354` — *Semantic Compression of LLM Instructions via Symbolic
Metalanguages* (MetaGlyph), van Gassen, Ernst (single author, Independent
Researcher), 2026-01-12. PDF in `../raw/`. Verified by curl against the arXiv
`citation_*` meta tags.

Membership operator (`∈`) fidelity, from the paper's table:

| model | scale | `∈` fidelity |
|---|---|---|
| OLMo | 7B | **0.0%** |
| Gemma | 12B | **0.0%** |
| Qwen | 7B | 20.4% |
| Llama | 3B | 33.3% |
| Kimi K2 | — | 36.0% |
| Gemini 2.5 Flash | — | 49.9% |
| Claude Haiku 4.5 | — | 26.0% |
| GPT-5.2 Chat | — | **91.3%** |

`∩` (intersection): 0.0% for Llama, Qwen, OLMo, Gemma and Kimi; 2.7% Gemini; 1.5%
Claude; **21.4%** GPT-5.2 Chat. Constraint composition fails across essentially all
models.

The paper's reading: *"Mid-sized open-source models (7B–12B) show near-zero operator
fidelity, suggesting a **U-shaped relationship** where sufficient scale overcomes
instruction-tuning biases."* It also reports GPT-5.2 Chat recovering the highest
membership fidelity observed, and Gemma 12B reaching 100% JSON parse success against
Llama 3B's 30%.

## what the audit's phrasing drops

Read as "small instruction-tuned models are worst", the row is fair and the numbers
are exact. Read as "instruction tuning degrades comprehension", it is not what the
paper says, because:

- GPT-5.2 Chat — instruction-tuned by any reasonable reading — posts **91.3%**, the
  highest in the set
- the author explicitly calls the relationship **U-shaped**, i.e. it recovers
- parse success *rises* with scale (Gemma 12B 100% vs Llama 3B 30%) even where
  operator fidelity does not

The audit's own framing elsewhere is "instruction-tuning degrades operator
comprehension", phrased as a general harm. The source's framing is a harm that scale
overcomes.

## why the distinction is load-bearing here

This audit's operational claim is that **operator fidelity is model-specific, not
universal** — and that part holds well. But the specific mechanism offered is
"instruction tuning is the culprit", and that mechanism is the part the source
contradicts at the top of the range.

For this workspace the corrected reading is the more useful one: the models in play
here are small and open, which places them in the **0–20% band**, not the ambiguous
middle. The audit reaches a right operational conclusion for its own models through
an over-general premise.

## also worth noting

The audit's row cites MetaGlyph for "∩ fails 0–21% across ALL models". Verified: the
range is 0.0%–21.4%, and "all models" holds. This row is clean.

## what to do

Keep the number, qualify the mechanism: instruction-tuned mid-size open models show
near-zero operator fidelity, with the relationship U-shaped and instruction-tuned
frontier models recovering. That preserves the audit's operational point and drops
the false generalisation.

## related

- `../raw/operator-fidelity-papers.md` — full source table for this audit
- `../../llm-specification-gotcha-contraction/granular-investigation/does-a-declarative-rewrite-remove-the-failure.md`
  — why the declarative mitigation has a measured cost of its own