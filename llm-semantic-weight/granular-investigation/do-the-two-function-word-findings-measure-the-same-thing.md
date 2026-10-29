# Do the two function-word findings measure the same thing?

**Concern:** the audit's tier-1 synthesis stacks a corpus finding and a mechanistic
finding into one causal story about why syntax outranks semantics. Does that
composition hold?

**Status: NO — they are two independent measurements, and the audit's causal reading
rests on a pairing no source made.**

## the two findings

**Corpus-side** (`arXiv:2601.21191`, Yang, Getz, Wilcox): across **186 languages**,
function words have high frequency, reliable syntactic association, and
phrase-boundary alignment — all three universal. Preserving these properties in
English training data facilitates acquisition, with a Goldilocks effect.

**Model-side** (same paper): in GPT-2 variants trained on that data, a small number of
attention heads **primarily in layers 3–4** account for most function-word attention,
and this concentration **fails** when any of the three properties is disrupted.

## what the audit builds on them

`../meta-audit.md`, tier 1:

> **Function words** (DET, ADP, CCONJ, SCONJ, AUX): specialized heads in layers 3-4
> (ACL 2026)
> Function words balance frequency (reliability) → diversity (informativeness) —
> Goldilocks effect

and the tier header asserts syntax is the **highest-weight grammatical category**,
which then places function words at the top of the weight sort.

## the seam

Read carefully, the paper's two results *are* connected — part (3) varies the corpus
properties and observes the head concentration appear and disappear. So the paper
itself establishes that corpus properties **cause** the representation, within GPT-2
variants on controlled data.

What the paper does **not** do is compare function-word weight against content-word
weight. There is no measurement here that function words are the *highest*-weighted
grammatical category. That ranking comes from the audit's tier table, which also draws
on:

- `arXiv:2512.03676` (Kryvosheieva et al.) — agreement-unit overlap
- LREC 2024 (Jang, Byun, Shin) — content words attended for semantic tasks, function
  words for syntactic tasks
- CoNLL 2026 embedding-geometry work — closed-class words occupy lower-dimensional
  subspaces

Those are three more subjects (seven open-weight models, BERT, embedding geometry)
and none of them measures a weight sort. The tier-1 heading is a **synthesis across
four papers on four subjects**, presented in the table's flat voice alongside rows
that are single-paper measurements.

## why the synthesis is not free

Two claims are being merged:

1. **Descriptive**: function words have concentrated early-layer representations, and
   syntactic tasks attend them more than semantic tasks do.
2. **Normative**: therefore syntax is the highest-weight grammatical category.

(2) needs a common scale across constructions — subjects, objects, predicates,
gerunds, clauses — to be a weight sort at all. No cited paper provides one. The audit
gets to a ranking without ever putting the ranked things on one axis.

## the irony worth stating

The tier table's own ranking places **syntax above semantics**, and its support for
that comes from two rows whose subjects are an *encoder* (BERT, LREC 2024) and
*GPT-2 variants* (function words), plus a set of *open-weight generative* models
(agreement). The claim about what modern generative LLMs represent is assembled from
encoder and small-model evidence, and the audit does not mark the seam.

## what to do

Split the tier-1 heading into two rows: what each cited paper measured, on which
subject; and separately, the audit's synthesis, marked as a synthesis. If the
highest-weight ranking is load-bearing, it needs one paper that measures weights on one
axis across constructions.

## related

- `are-function-word-heads-a-general-llm-finding.md` — the layer-3/4 row's actual subject
- `do-determiners-recruit-the-most-shared-units.md` — the third tier-1 row, whose
  statistic measures within-category overlap
- `whose-paper-is-where-meaning-lives.md` — the attribution fault in the same table
- `../raw/function-word-and-agreement-papers.md` — full source table for this audit