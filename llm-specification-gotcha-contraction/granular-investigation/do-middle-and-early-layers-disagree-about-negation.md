# Do middle and early layers disagree about negation?

**Concern:** three verified papers all locate negation's failure mechanism, and they
give three different layer windows. Does the audit's tier table depend on picking one?

**Status: the papers do not agree, and the audit's early/late split is a different
claim from any of them.**

## the three layer windows

| source | window | what it claims |
|---|---|---|
| `arXiv:2601.08070` (Semantic Gravity Wells, Rana) | **23–27** | activation patching there flips the sign of constraint effects |
| `arXiv:2511.12381` (Don't Think of the White Bear, Mann et al.) | **middle-layer** heads amplify forbidden tokens, **early** layers suppress | circuit tracing |
| `arXiv:2605.03052` (How Language Models Process Negation, Zhou et al.) | **mid-layer** construction of a ¬Y representation; **late-layer** attention is the shortcut source of wrong answers | Mistral-7B, Llama-3.1-8B |

The first is a specific numeric window in one model family. The other two are
relative descriptions in others. They are not necessarily in conflict — "middle" can
mean different things across model depths — but they cannot be quoted as one finding
either.

## the fourth claim, which is the audit's

`arXiv:2604.06015` (Rocchetti & Ferrara) reports tasks stratify by complexity across
layers, *"with structural constraints emerging early and semantic tasks emerging
late"*.

That is a claim about **constraint type**, not about prohibition and not about
negation. The audit's tier table uses it as though it were the layer story for
negative constraints. It is a different measurement.

## why this matters for the tier table

The audit layers two things into one depth story:

1. *constraint processing depth* — early for structural, late for semantic (Rocchetti & Ferrara)
2. *negation processing depth* — where suppression fails (Rana), where construction happens (Zhou et al.), where priming amplifies (Mann et al.)

These are compatible but independent. Reading them as one chain — "prohibitions are
semantic, therefore late, therefore tier 3 is fragile" — is an inference the sources
do not license, and it is the chain that makes tier 3 look like the weak one.

Notably, the one source with a measured causal window (23–27, late) is the one whose
scope does not cover the audit's behavioural tier. The mechanism the audit leans on
is the mechanism measured least, and the mechanism measured most was scoped out.

## what to write instead

Two sentences, cited separately: one for constraint depth, one for negation depth.
No merged claim, and no layer number without naming its model family.

## related

- `does-priming-evidence-transfer-to-output-shape-prohibitions.md` — why the one
  causally-patched source has the wrong scope for tier 3
- `../raw/negative-constraint-papers.md` — full source table for this audit