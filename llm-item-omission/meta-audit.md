---
id: INV.LLM.OMIT.ITEM
title: What Predicts Under-Production Against an Enumerated Request
summary: Cross-region investigation into why a model emits fewer items than an
  instruction enumerated, when it demonstrably holds all of them. Covers omission
  under production, scope conformance, item salience, self-reference, and
  position effects in enumerated-output instruction following. Distinct from
  INV.LLM.SPEC.CONTRACT (gotcha vs contraction) and INV.LLM.OPERATOR (operator
  fidelity): both of those study PROHIBITION, and neither can see under-production
  because an item can be silently absent from an instruction that prohibits
  nothing at all.
tags: [llm, instruction-following, omission, under-production, scope-conformance,
  enumerated-output, self-reference, position-effect, compliance, salience]
tables: [regions, sources, researchers, meta_analyses, gaps, fundamentals,
  hypotheses, confound_audit]
---

**Core question**: what predicts a model's failure to emit all the items an
instruction enumerated?

**Answer so far: UNANSWERABLE from our own corpus, by construction.** The eval that
produced 61 cases and 16 failures varies model, framing, context length, scope and
difficulty — and varies nothing about item identity. Every expected set in every case
requests a `model` item, so the corpus has no contrast on *which item* is dropped and
cannot distinguish a self-reference effect from a position effect from plain
forgetting. The omission question is not unanswered because the literature is thin.
It is unanswered because the axis was never varied.

Pattern: prohibited-item → absent-item → unmeasured-item-identity

## why this is a separate investigation and not a fourth tier of another

The three sibling `llm-*` audits study the *constraint*: its polarity
(`INV.LLM.SPEC.CONTRACT`), its operator encoding (`INV.LLM.OPERATOR`), and the
internal representation of its function words (`INV.LLM.SEM.WEIGHT`). All three
are about **negative specification** — what the model was told not to do.

Under-production is orthogonal to that. An instruction can enumerate four items,
prohibit nothing, and the model emits three. No prohibition is present to fail, so
every prohibition-frame detector in the sibling audits reads it as unconstrained —
correctly, and uselessly. Measured on the drift corpus: scope restriction appears in
**14 of 14** unique steer texts and polarity in **7 of 14**, so the prohibition
literature is looking at the minority form of what these instructions actually do.

## the confound, stated as a finding rather than a caveat

From `model-drift-protocol/cases.json` (61 cases, 16 failures):

| | count |
|---|---|
| cases whose `expected` set includes a `model` item | **61 / 61** |
| failures whose `expected` set includes a `model` item | **16 / 16** |
| failures whose notes record the `model` item specifically missing | 6 |
| failures with a `model` item present in `expected` and present in the response | the rest |

Because the item is requested in **every** case, `model` is always a candidate for
omission and is never contrasted against an alternative. The recurring observation
("third straight model-drop on listing tasks", `r6-2-omission`) is therefore
**consistent with three hypotheses that make different predictions** and is currently
evidence for none of them.

This is the same shape as two defects already recorded elsewhere in this workspace:
constraint-form saturation (scope present in 14/14, zero variance) and a denominator
mismatch (2 lanes sharing 1 steer text, read as 2 sends). **An instrument with no
variance on the variable cannot rank on it.**

## the four hypotheses, and why they separate

Stated as a RANKING rather than a set, because a theory that only says "include these
too" agrees with every measurement and certifies nothing.

| | hypothesis | prediction | what would refute it |
|---|---|---|---|
| **H1** | self-reference — items requiring the model to report on itself are dropped preferentially | omission rate on self-referential items exceeds omission rate on non-self-referential items at matched position and matched item count | equal rates |
| **H2** | enumeration load — each requested item costs a slot | omission rate rises monotonically with the number of items requested | flat or non-monotonic in item count |
| **H3** | position — the last item in the list is truncated | omission rate on the final item exceeds the rate on earlier items, and the excess follows POSITION when the self-referential item moves | omission follows the self-referential item when it moves to the middle |
| **H4** | constraint tension — a scope restriction competing with a default behaviour causes under-production | omission rate rises when a scope restriction is present, at matched item count and matched framing | no difference |

**H1 and H3 are the decisive pair and they separate with one move.** Put the
self-referential item in the MIDDLE of a four-item request. If omission follows the
item, H1 holds. If omission follows the slot, H3 holds. That single arm separates
them; no other arm does.

A fifth, recorded because the sibling audit raises it and not because this audit
assumes it: **H5 reasoning-capacity tension** — the MathIF line in
`INV.LLM.SPEC.CONTRACT` reports that models reasoning more effectively struggle to
comply with directives, and that reasoning-oriented tuning degrades instruction
adherence as generation length grows. If under-production scales with reasoning
effort rather than with request shape, the four hypotheses above are all measuring a
proxy.

## why the audit must not assume its own answer

The drift corpus's own fixes were STRUCTURAL — order `model FIRST` in NEXT, and the
bare-BODY canonical form (`03-corrections.md`) — and the working fix targeted
**position**, which is H3. Two fixes reduced omission without changing any
prohibition, which is consistent with a positional mechanism and inconsistent with a
polarity mechanism.

**That is a hint from a corpus of 15 verdicts, and it is exactly the kind of hint
this audit exists to test rather than adopt.** It is recorded here as the first thing
a designed arm should try to refute, because an audit that begins from its own
workspace's preferred answer will find it in every paper.

## what this investigation must produce

- **a confound audit** of the existing 61-case corpus, naming every axis that is
  saturated, absent, or confounded by construction — so the next eval is designed
  rather than accumulated
- **a designed arm** that varies item identity, item count, and item position
  independently, which the existing corpus does not vary at all
- **per-item omission rates** by item type, which requires a labelling scheme for item
  types that does not yet exist
- **an explicit boundary**: this audit asks what predicts omission in an enumerated
  request. It does not reopen the prohibition question — `INV.LLM.SPEC.CONTRACT`
  falsified that, at n=15, and the falsification stands

## falsified already, do not rebuild

- **negative framing does not predict drift** — `INV.LLM.SPEC.CONTRACT`, n=15
  verdicts, `no X` present 50% vs absent 44%. Replicated at tier granularity; the
  tier axis collapses onto the same partition. Stands.
- **the tier-2 / tier-3 split does not separate** — the same replication. Stands.
- **a declarative rewrite is not shown to remove failure** — the 81% figure is
  cross-linguistic VARIANCE reduction, not a compliance rate. Stands.

## data

`_schema/db.sql` — additive only, `ALTER TABLE ADD COLUMN`, never DROP. Carries
`hypotheses` and `confound_audit` beyond the sibling audits' table set, because an
audit that expects to be wrong needs somewhere to record what it was wrong about.

Records land in `raw/` (what was fetched) and one concern per file in
`granular-investigation/` (what the fetching established).