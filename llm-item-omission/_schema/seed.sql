-- Seed: What Predicts Under-Production Against an Enumerated Request
-- Rows here are the audit's PRIOR state: what it believes going in, and what it
-- must not rebuild. Sources: model-drift-protocol cases.json and
-- 05-negative-framing-falsified.md. No literature rows yet — the audit has not
-- searched, and a seeded source that was never fetched is exactly the defect
-- tooling-citation-artifact.txt exists to prevent.

INSERT OR IGNORE INTO investigations (id, title, summary, tags) VALUES (
  'INV.LLM.OMIT.ITEM',
  'What Predicts Under-Production Against an Enumerated Request',
  'Cross-region investigation into why a model emits fewer items than an instruction enumerated, when it demonstrably holds all of them. Unanswerable from the local corpus by construction: item identity is never varied.',
  'llm, instruction-following, omission, under-production, scope-conformance, enumerated-output, self-reference, position-effect'
);

-- ── HYPOTHESES. Each states what must be observed for it to FAIL. ──────────
INSERT OR IGNORE INTO hypotheses (id, investigation_id, label, statement, axis_varied, predicts, refuted_by, separating_arm, status) VALUES
('h1','INV.LLM.OMIT.ITEM','H1',
 'Self-reference: items requiring the model to report on itself are dropped preferentially over items it can read off the world.',
 'item identity',
 'omission rate on self-referential items exceeds the rate on non-self-referential items, at matched item count and matched position',
 'the two rates are equal, or the self-referential item is retained as often as a non-self-referential one',
 'put the self-referential item in the MIDDLE of a four-item request: if omission follows the item, H1 holds; if it follows the slot, H3 holds',
 'untested'),
('h2','INV.LLM.OMIT.ITEM','H2',
 'Enumeration load: each requested item costs a slot, and omission rises with the number of items requested.',
 'item count',
 'omission rate rises monotonically with item count (2 < 3 < 4 < 6)',
 'omission rate is flat or non-monotonic in item count',
 'fix item identity and position, vary only the count',
 'untested'),
('h3','INV.LLM.OMIT.ITEM','H3',
 'Position: the final item in an enumeration is truncated.',
 'item position',
 'omission rate on the final item exceeds the rate on earlier items, and the excess travels with POSITION when items are reordered',
 'omission travels with the self-referential item rather than with the slot when the list is reordered',
 'the same middle-item arm that separates H1; no other arm separates the pair',
 'untested'),
('h4','INV.LLM.OMIT.ITEM','H4',
 'Constraint tension: a scope restriction competing with the model''s default behaviour causes under-production.',
 'scope restriction present/absent',
 'omission rate is higher when a scope restriction is present, at matched item count and matched framing',
 'no difference in omission rate with the restriction present or absent',
 'hold polarity framing fixed across both arms',
 'untested'),
('h5','INV.LLM.OMIT.ITEM','H5',
 'Reasoning-capacity tension: under-production scales with reasoning effort rather than with request shape, making H1-H4 proxies.',
 'reasoning effort / generation length',
 'omission rate rises with generation length or reasoning budget, independently of request shape',
 'omission rate is independent of reasoning effort at fixed request shape',
 'hold request shape fixed and vary only the reasoning budget',
 'untested');

-- ── CONFOUND AUDIT. The audit's own corpus, measured. ───────────────────────
INSERT OR IGNORE INTO confound_audit (id, investigation_id, axis, question_it_must_answer, observed_variance, needed_variance, verdict, evidence, corpus) VALUES
('c1','INV.LLM.OMIT.ITEM','item identity',
 'which KIND of requested item gets dropped',
 'ZERO. Every expected set in all 61 cases requests a model item, so the self-referential item is always a candidate and is never contrasted with an alternative',
 'items of at least two kinds, self-referential and not, crossed with position',
 'saturated',
 '61/61 cases and 16/16 failures include a model item in expected; 6 failure notes record that item specifically missing; no case omits any other item kind',
 'model-drift-protocol cases.json'),
('c2','INV.LLM.OMIT.ITEM','constraint form (scope)',
 'whether a scope restriction changes the failure rate',
 'SATURATED. Scope restriction appears in 14/14 unique steer texts (read-only, only, verbatim, exactly, head-N, top-N)',
 'scope restriction present in roughly half the arms and absent in the rest',
 'saturated',
 'zero variance means zero discriminative power: no classifier can be trained on a variable that never varies',
 'model-drift-protocol 04-redirect-messages.md'),
('c3','INV.LLM.OMIT.ITEM','constraint form (polarity)',
 'whether prohibition framing changes the failure rate',
 'PRESENT IN HALF. Polarity appears in 7/14 unique steer texts, determiner-led no accounting for 6 of the 7',
 'polarity present and absent at matched difficulty, with the scope arm held fixed',
 'confounded',
 'falsified already: no X present 50% vs absent 44% at n=15. stands, do not rebuild',
 '05-negative-framing-falsified.md'),
('c4','INV.LLM.OMIT.ITEM','denominator',
 'how many distinct instructions were sent',
 'AMBIGUOUS. 21 sends resolve to 14 unique texts; 2 lanes received 1 shared steer text, and were counted as 2 sends',
 'a stated denominator per arm: sends, lanes, or unique texts',
 'confounded',
 'the framed arm read 2 in the falsification record because 2 lanes shared one text; only the send count is a detector denominator',
 '05-negative-framing-falsified.md vs 04-redirect-messages.md'),
('c5','INV.LLM.OMIT.ITEM','item count',
 'whether more requested items means more omission',
 'NARROW. requests are 2-3 items; the corpus does not span 4 or more',
 'item counts spanning at least four values, with identity and position held fixed',
 'confounded',
 'every expected set in the corpus is 2 or 3 items, so H2 has no gradient to be tested on',
 'model-drift-protocol cases.json');

-- ── ALREADY FALSIFIED. Named so this audit does not rebuild them. ───────────
INSERT OR IGNORE INTO falsified (id, investigation_id, claim, source_investigation, verdict, do_not_rebuild) VALUES
('f1','INV.LLM.OMIT.ITEM','negative framing does not predict drift','INV.LLM.SPEC.CONTRACT','falsified at n=15','do not re-test polarity as a predictor; the no X arm separated 50% vs 44%'),
('f2','INV.LLM.OMIT.ITEM','the tier-2 / tier-3 prohibition split separates failures','INV.LLM.SPEC.CONTRACT','falsified; the tier axis collapses onto the no X partition','do not re-test tiers; the replication reproduced the existing table'),
('f3','INV.LLM.OMIT.ITEM','a declarative rewrite removes the failure','INV.LLM.SPEC.CONTRACT','unsupported; the 81% figure is cross-linguistic VARIANCE reduction, not a compliance rate','do not treat X: disabled as a fix; no source measures a compliance rate for it');