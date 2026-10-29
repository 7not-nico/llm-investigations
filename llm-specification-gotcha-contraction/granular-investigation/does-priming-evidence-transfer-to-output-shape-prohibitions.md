# Does the priming evidence transfer to output-shape prohibitions?

**Concern:** the audit's tier table treats one class of negative-instruction failure
as covering both named-token bans and style/output-shape prohibitions. Does the
evidence transfer?

**Status: NO — the mechanism does not reach the shape case, and the transfer is the
audit's own inference, not any paper's claim.**

## what was checked

`arXiv:2601.08070` — *Semantic Gravity Wells: Why Negative Constraints Backfire*,
Rana, Shailesh (single author), 2026-01-12, cs.AI, 10pp/8 figures, code at
`github.com/gut-puncture`. Metadata and abstract read from the arXiv `citation_*`
meta tags; PDF in `../raw/`.

## what the paper measures

The paper opens by defining its own intervention: *"Negative constraints
(instructions of the form 'do not use word X')"*. Every headline number sits inside
that scope.

- semantic pressure → violation probability: `p = σ(-2.40 + 2.27·P₀)`
- n = 40,000 samples; bootstrap 95% CI for the slope `[2.21, 2.33]`
- suppression is **present but weaker in failures**: −5.2pp vs −22.8pp, a 4.4× asymmetry
- priming failure **87.5%** of violations; override failure 12.5%, with +0.39
  late-layer FFN contribution — nearly 4× larger than in successes
- layers **23–27** causally responsible; activation patching there flips the sign

## why the scope does not transfer

The stated mechanism is that **naming a forbidden word activates it**. That is a claim
about the referent of the prohibition being a specific token with a well-defined
probability.

`no summary`, `no invented files`, `no extra reasoning` — the forms this corpus is
dominated by — do not name a token. They constrain an output *shape*. Two different
operations:

| | named token | unnamed shape |
|---|---|---|
| referent | a word with a probability | a property of the response |
| mechanism available | activate-then-suppress | none established here |
| paper's evidence | direct, n=40,000 | none |

The large magnitude does not widen the mechanism. A 87.5% failure rate on token bans
says nothing about whether output-shape prohibitions fail at 87.5%, at 5%, or at all.

## what this does to the audit

Two rows in `../meta-audit.md` inherit the 87.5% figure at the behavioural tier.
They should carry the scope with them or lose the number. The mechanism they need
does not currently exist in any verified source — see
`does-an-artifact-back-the-40-negative-threshold.md` for how thin the tier-3
evidence actually is.

## what would settle it

A probe that varies the prohibition's referent across both kinds — token ban versus
output-shape constraint, matched for length and register — and measures violation
rate for each. That is a two-arm test, not a literature question, and it is the same
two-arm shape the eval-1 brief already proposes.

## related

- `../raw/negative-constraint-papers.md` — full source table for this audit
- `do-middle-and-early-layers-disagree-about-negation.md` — the layer numbers do not
  agree across sources, and this paper's are the late ones