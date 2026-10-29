# Function-word and agreement papers — resolved against primary sources

**Date:** 2026-10-01
**Subject:** the papers behind the tier-1 syntax / function-word claims of `../meta-audit.md`
**Method:** `curl` on `arxiv.org/abs/<id>` and `aclanthology.org`, metadata read
from `citation_*` meta tags and from Anthology's embedded BibTeX. Claims checked
against each paper's own abstract text.

## Queries

1. `Kryvosheieva de Varda Fedorenko Tuckute syntactic agreement same units arXiv`
2. `function words statistical cues specialized attention heads arXiv ACL 2026`
3. `Jang Byun Shin attention scores lexical categories syntactic semantic GLUE LREC 2024`

## Sources Fetched

| Source | Institution | Type | Key Content |
|--------|-------------|------|-------------|
| arXiv:2512.03676 — *Different types of syntactic agreement recruit the same units within large language models* | Kryvosheieva, Daria; de Varda, Andrea; Fedorenko, Evelina; Tuckute, Greta | paper, cs.CL | v1 2025-12-03, rev. 2026-04-11. Functional localization over **67 English syntactic phenomena in seven open-weight models**. Units consistently recruited across sentences and causally support syntactic performance. **Different agreement types — subject-verb, anaphor, determiner-noun — recruit overlapping unit sets**, making agreement a meaningful functional category. Holds in English, Russian, Chinese; cross-lingual analysis over **57 languages** where structurally more similar languages share more subject-verb units. |
| arXiv:2601.21191 — *Function Words as Statistical Cues for Language Learning* | Yang, Xiulin; Getz, Heidi; Wilcox, Ethan Gotlieb | paper, cs.CL, **Comments: ACL 2026** | v1 2026-01-29, rev. 2026-04-20. Cross-linguistic corpus analysis of **186 languages** confirming three distributional properties of function words: high frequency, reliable syntactic association, phrase-boundary alignment. Counterfactual language modeling + ablation on English: preserving these properties facilitates acquisition, with a **Goldilocks effect** — frequent enough to be reliable, diverse enough to stay informative. Probing shows learning conditions produce systematically different reliance on function words. |
| ACL Anthology 2024.lrec-main.148 — *A Study on How Attention Scores in the BERT Model Are Aware of Lexical Categories in Syntactic and Semantic Tasks on the GLUE Benchmark* | Jang, Dongjun; Byun, Sungjoo; Shin, Hyopil | paper, LREC-COLING 2024, pp. 1684–1689, Torino | States the hypothesis as a hypothesis and substantiates it: in downstream tasks prioritizing **semantic** information, attention centered on **content words** is enhanced; where **syntactic** information is prioritized, attention on **function words** is intensified. Six GLUE tasks. Also finds BERT layers that consistently bias attention toward specific lexical categories regardless of task. |
| arXiv:2601.03798 — *Where meaning lives: Layer-wise accessibility of psycholinguistic features in encoder and decoder language models* | **Tikhomirova, Taisiia; Wulff, Dirk U.** | paper | 2026-01-07. The paper the audit's "final layer rarely optimal" claim actually belongs to. **Not Skean et al.** — see the attribution correction below. |
| arXiv:2502.02013 — *Layer by Layer: Uncovering Hidden Representations in Language Models* | Skean, Oscar; Arefin, Md Rifat; Zhao, Dan; Patel, Niket Naghi | paper | The paper the audit *named*. A different work from the one it cited the finding from. PDF deposited here so the two can be compared. |

## Citation corrections found while resolving

**REFUTED — the `Skean et al.` attribution.** `meta-audit.md` cites *"Where meaning
lives: Layer-wise accessibility"* to **Skean et al.** The paper by that title is
arXiv:2601.03798, by **Tikhomirova & Wulff**. "Skean et al." is a different paper —
arXiv:2502.02013, *Layer by Layer: Uncovering Hidden Representations in Language
Models*. The audit's row merges two distinct works: it takes the title and finding
from one and the authors from the other.

The **finding survives** — Tikhomirova & Wulff do report that the final layer is
rarely optimal for psycholinguistic features, and that layer-wise accessibility
differs between encoder and decoder models. What is wrong is the attribution, which
means the row currently points a reader at a paper that does not contain its claim.

**Numeric drift, same direction.** *Emergence and Localisation of Semantic Role
Circuits* (arXiv:2511.20910, Aljaafari, Carvalho, Freitas) reports **89–94%** within
28 nodes and **24–59%** component overlap. The audit's table says 89–92% and 24–51%.
The finding is the same; the ranges have narrowed at both ends. Neither end is
load-bearing for the audit's argument, but a table whose numbers drift from its
sources cannot be trusted without re-derivation.

**Overstated — "NP-carries-roles, *not* verbs."** *The signal is coming from inside
the noun phrase!* (DOI `10.18653/v1/2026.scil-main.40`, Li, Lynch, van Schijndel)
supports the noun phrase as the carrier of proto-role information. The audit's "not
verbs" is stronger than the paper's position, which is that NPs are *at least as*
informative as verbs.

## Verification verdict

**VERIFIED — the agreement-overlap claim.** The audit's tier-1 row is
"Kryvosheieva, ACL 2026, agreement categories recruit overlapping units." The
paper is real, the authors match, and the overlapping-units finding is its stated
headline. The venue is **arXiv preprint with a later revision**; the audit's
"ACL 2026" venue label was not visible on the abs page, so treat the venue as
unconfirmed until a proceedings record is found.

**VERIFIED IN FULL TEXT, MISREAD IF TAKEN AS A CROSS-CATEGORY CLAIM — the
68.91% / 40.29% / 23.10% overlap percentages.** The figures are real and appear in
the Results (p. around the Figure 4 discussion): *"this pattern appears to be driven
by the three agreement categories: determiner-noun agreement, subject-verb
agreement, and anaphor agreement (average within-category overlaps: 68.91%, 40.29%,
and 23.10%, respectively)."*

Two things must travel with the numbers. First, they are **within-category**
overlaps — how much units recur across *instances of the same* agreement type — not
how much determiner-noun units overlap subject-verb units. The audit's phrasing
("agreement categories … recruit overlapping units") reads as the latter. Second,
the statistic that carries the finding is the **within vs cross contrast**
(t = 2.07, p = 0.0312, Welch), and the paper reports the three numbers as *drivers of*
that contrast, not as a ranking of agreement types by importance. Separately, the
paper measures cross-category overlap with agreement phenomena at 15.26%–23.17%
versus 5.72%–8.23% for non-agreement phenomena.

So the determiners-are-strongly-represented inference is *suggested* by a
within-category statistic, which is not the quantity that claim needs. That makes
it a hypothesis, not a measured result — and it is exactly the load-bearing step in
the audit's argument about `no X`.

**VERIFIED IN FULL TEXT — "specialized attention heads for function words in layers
3–4".** The claim is accurate and precisely stated. The abstract omits it (a
corpus-statistics framing: 186-language analysis plus counterfactual language
modeling and ablations), but the Results carry it: *"Models trained with NATURAL
FUNCTION exhibit a highly concentrated pattern of function word attention: a small
number of heads, primarily in Layers 3 and 4, account for the majority of function
word attention across BLiMP categories."* Conditions disrupting any of the three
distributional properties — random dependency, bigram dependency, within-boundary —
fail to produce the concentrated pattern; so do models trained without function
words.

**Two scope facts the audit omits and should not drop.** The models are **GPT-2**
variants trained on the paper's own counterfactual language variants, not the seven
open-weight models of the agreement paper or a modern LLM. And the heads are found
by an attention probe, with the finding tied to the presence of the three
distributional properties in the training corpus. "Function words get dedicated
heads in layers 3–4" is therefore a statement about *a learner trained on a
well-formed corpus*, which is a narrower subject than "in LLMs".

**VERIFIED — the LREC 2024 claim, with the model named.** Jang/Byun/Shin confirm
the content-word / function-word attention split by task type. Note the subject is
**BERT**, an encoder — not a generative LLM, and not one of the seven open-weight
models in the agreement paper. The two verified papers therefore cover two
different architectures, which is worth stating wherever the finding is reused.

**MECHANISM GAP — the audit's tier table mixes two kinds of claim.** "Function
words get dedicated heads in layers 3–4" is a claim about representation inside a
model. "Function words are frequent, reliably associated, and boundary-aligned
across 186 languages" is a claim about corpora that *explains why* a learner would
build such a circuit. Neither measured the other, and the audit's tier ranking
("syntax is the highest-weight grammatical category") rests on the pair being one
result rather than two.