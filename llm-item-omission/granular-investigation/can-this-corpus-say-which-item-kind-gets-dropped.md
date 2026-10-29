# Can this corpus say which item kind gets dropped?

**Concern:** `fail-omission` is the most common verdict in the drift corpus, and
six failure notes specifically record the *same* item going missing. Does the corpus
support an inference about which KIND of item is omission-prone?

**Status: NO. Item identity has zero variance. The observation is consistent with
three hypotheses that make different predictions and is evidence for none of them.**

## what was measured

From `model-drift-protocol/cases.json` — 61 cases, 16 failures:

| | count |
|---|---|
| cases whose `expected` set includes a `model` item | **61 / 61** |
| failures whose `expected` set includes a `model` item | **16 / 16** |
| failure notes recording the `model` item specifically missing | 6 |

The six notes are near-identical in phrasing, and one says so outright:

- `r5-invention-omission` — "names all correct (7/7 on disk), **model dropped**"
- `r6-3-omission` — "7/7 names correct + explicit scope bound, **model dropped**"
- `r6-2-omission` — "head-3 exact, **model dropped** — third straight model-drop on listing tasks"
- `longcat-r10-2-scopewalk` — "asked head-3, emitted 3 of many (under-answer); **model field dropped**"
- `r5-summary-drift` — filenames present but annotated with commentary; model item also dropped
- `r2-2-drift` — the inverse: model-only, `date+echo` dropped

## why the observation licenses no inference

The `model` item is requested in **every single case**. That has two consequences
that pull in opposite directions, and the corpus cannot tell them apart:

1. If omission follows the item's **kind** — because self-referential items are
   harder, less salient, or require an access the model does not have — then `model`
   drops disproportionately often.
2. If omission follows **presence** — the item that is in every request is in every
   request's candidate set, so it accumulates more opportunities to drop, and the
   other items simply have fewer chances — then `model` drops proportionally and
   nothing about self-reference is involved.

**A variable present in 100% of trials has no contrast, so it cannot be ranked
against anything.** Every case offers `model` as a candidate; no case offers a
non-self-referential item in the same slot as a competitor. The recurring drop is
consistent with a real effect and equally consistent with the base rate.

The one datum that *looks* like it discriminates — `r2-2-drift`, where `model`
survived and `date+echo` went — argues **against** a pure self-reference effect, and
the record does not treat it that way.

## the confound, and it is the same shape as three already recorded

Four axes in this workspace's instruments are unanswerable for the same reason, and
this is the fourth:

| axis | variance | question needs |
|---|---|---|
| constraint form — scope | saturated at 14/14 | present in ~half the arms |
| constraint form — polarity | present in 7/14 | matched difficulty, scope held fixed |
| denominator | 21 sends → 14 unique texts | one stated denominator per arm |
| **item identity** | **61/61, zero contrast** | **two item kinds, crossed with position** |

Per `tooling-ranking-axis.txt`: an ordering assembled from unaligned subjects is a
hypothesis in table form. Here there is no ordering at all — there is one subject.

## what the corpus CAN support, and it is not nothing

Two things survive:

- **The dominant failure mode is under-production, not over-production.** The scope-walk
  notes say so in the record's own words: *"emitted 3 of many (under-answer, not
  over)"*. That is a direction, and it is a fact about 15 verdicts.
- **The corpus's own working fixes were positional.** `03-corrections.md`'s repairs
  were ordering `model FIRST` in NEXT and the bare-BODY canonical form — the
  operators moved **position**, not polarity. That is weak, consistent with H3, and
  comes from 15 verdicts.

The second is a hint, and it is why the audit begins by trying to refute it.

## what would settle it

**One arm separates the decisive pair.** Put the self-referential item in the
**middle** of a four-item request:

- omission follows the **item** wherever it sits → H1 (self-reference)
- omission follows the **slot** → H3 (position)

No other arm separates those two, and both predict the same thing in the corpus as it
stands. The full hypothesis set, each with its refutation condition, is seeded in
`../_schema/db.sql` (`hypotheses` table).

## related

- `../../llm-specification-gotcha-contraction/granular-investigation/does-priming-evidence-transfer-to-output-shape-prohibitions.md`
  — the sibling blind spot: the prohibition literature cannot see absence, because an
  item can be missing from an instruction that prohibits nothing
- `../meta-audit.md` — the audit this file belongs to
- `../_schema/seed.sql` — `confound_audit` rows c1 (item identity), c4 (denominator),
  c5 (item count)