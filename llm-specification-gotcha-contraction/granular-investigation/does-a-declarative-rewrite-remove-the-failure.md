# Does a declarative rewrite remove the failure or only reduce variance?

**Concern:** the audit and both sibling files recommend rewriting prohibitions into
declarative form (`X: disabled`). Does a verified source show that this *removes* the
failure, or only reduces cross-linguistic variance?

**Status: only the weaker claim is supported. The mitigation may be doing nothing
about the mechanism the tier table is built on.**

## the source

`arXiv:2603.25015` — *Imperative Interference: Social Register Shapes Instruction
Topology in Large Language Models*, Mason, Tony (single author), 2026-03-26, cs.CL /
cs.AI / cs.SE. PDF in `../raw/`.

What it measures: instruction-level ablation across **four languages × four models**.

- English imperative instructions **cooperate**; Spanish imperative instructions
  **compete** — same semantic content, opposite interaction topology
- the inversion is mediated by **social register**: imperative mood carries different
  obligatory force across speech communities
- declarative rewriting of **one** instruction block reduces cross-linguistic
  variance by **81%** (p = 0.029, permutation test)
- rewriting **three of eleven** imperative blocks flips Spanish topology from
  competitive to cooperative, with spillover onto unrewritten blocks
- corpus: 22 hand-authored probes against a production system prompt of 56 blocks
- the paper's own framing: `"NEVER do X"` is an exercise of authority whose force is
  language-dependent; `"X: disabled"` is a factual description that transfers

## what it does not measure

It does not measure violation rate. It measures **variance across languages**. Those
are different quantities:

- 81% variance reduction = the rewrite makes languages behave more like each other
- failure removal = the rewritten instruction is complied with more often

A rewrite could cut cross-linguistic variance to near zero while compliance stayed
exactly as low in every language, and the headline figure would be unchanged. Nothing
in the abstract reports a compliance rate.

## why this matters here

The gotcha tier's claim is that prohibitions fail — that failure is what the 87.5%
priming figure is measuring, and what the (unbacked) 40% threshold was offered as
independent support for. If the declarative mitigation only equalises behaviour across
languages, it does not address a failure that is already uniform.

Mason's own framing is more modest than the audit's use of it: a *register* effect,
language-dependent, with an inference the paper marks as a **testable prediction**
rather than a result — *"constitutional AI principles authored in imperative mood may
create language-dependent alignment."*

## the compounding problem

`arXiv:2601.07354` (MetaGlyph, van Gassen) measures declarative symbolic notation on
the same axis and finds it is not free: `∈` operator fidelity spans **26%–91%**
across eight models, and `∩` composition fails in all but one. So the replacement
form has a measured fidelity spread of its own.

That is not a refutation of the mitigation — the two papers measure different things.
It does mean the mitigation is a **trade**, and the audit presents it as a free fix.

## what would settle it

An arm with prohibitions and a matched arm with `X: disabled` substitutions, both
scored for compliance rate, not variance. Per the rewriter's substitution set as a
declared treatment.

## related

- `does-priming-evidence-transfer-to-output-shape-prohibitions.md` — the mechanism
  the rewrite would need to remove
- `../raw/negative-constraint-papers.md` — full source table for this audit