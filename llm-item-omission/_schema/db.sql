-- Investigations: What Predicts Under-Production Against an Enumerated Request
-- Additive migrations only: ALTER TABLE ADD COLUMN, never DROP
--
-- TWO TABLES THE SIBLING AUDITS DO NOT CARRY, and the reason is the audit's
-- stance. `hypotheses` holds a RANKING rather than a set, because a theory that
-- only says "include these too" agrees with every measurement and certifies
-- nothing. `confound_audit` exists because this audit's own corpus is confounded
-- by construction: an investigation that finds the confound in its own data needs
-- somewhere to record confounds it has not yet found in others.

CREATE TABLE IF NOT EXISTS investigations (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  summary TEXT NOT NULL,
  tags TEXT NOT NULL,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS regions (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  region TEXT NOT NULL,
  language TEXT NOT NULL,
  sources_found INTEGER DEFAULT 0,
  relevance TEXT NOT NULL CHECK (relevance IN ('PASS','WARN','FAIL')),
  notes TEXT
);

CREATE TABLE IF NOT EXISTS sources (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  title TEXT NOT NULL,
  authors TEXT,
  venue TEXT,
  year INTEGER,
  identifier TEXT,              -- arXiv id, DOI, or OpenReview id; NULL when unresolved
  url TEXT,
  finding TEXT,                  -- what the source claims, in its own terms
  scope_note TEXT,               -- the intervention the finding was measured on
  artifact_verified INTEGER DEFAULT 0 CHECK (artifact_verified IN (0,1))
);

CREATE TABLE IF NOT EXISTS researchers (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  name TEXT NOT NULL,
  affiliation TEXT,
  contributions TEXT
);

CREATE TABLE IF NOT EXISTS meta_analyses (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  title TEXT NOT NULL,
  scope TEXT NOT NULL,
  finding TEXT NOT NULL,
  caveat TEXT
);

CREATE TABLE IF NOT EXISTS gaps (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  description TEXT NOT NULL,
  why_it_matters TEXT NOT NULL,
  closable_by TEXT
);

CREATE TABLE IF NOT EXISTS fundamentals (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  title TEXT NOT NULL,
  finding TEXT NOT NULL,
  evidence TEXT NOT NULL,
  confidence TEXT NOT NULL CHECK (confidence IN ('High','Medium','Low'))
);

-- A HYPOTHESIS IS A RANKING WITH A REFUTATION, never a membership claim.
-- `predicts` states what must be observed for the hypothesis to hold;
-- `refuted_by` states what must be observed for it to fail. A hypothesis with an
-- empty `refuted_by` is a set, not a theory, and cannot be tested.
CREATE TABLE IF NOT EXISTS hypotheses (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  label TEXT NOT NULL,                       -- H1..Hn
  statement TEXT NOT NULL,
  axis_varied TEXT NOT NULL,                 -- the independent variable this arm moves
  predicts TEXT NOT NULL CHECK (length(trim(predicts)) > 0),
  -- refuted_by is ENFORCED, not merely required. A first draft used plain NOT NULL
  -- and a hypothesis with refuted_by = '' was accepted, because NOT NULL rejects
  -- NULL and not the empty string — so the law "a hypothesis with nothing that
  -- refutes it is a set, not a theory" was stated in a comment and not enforced.
  -- length() > 0 is what makes the comment true.
  refuted_by TEXT NOT NULL CHECK (length(trim(refuted_by)) > 0),
  separating_arm TEXT,                       -- the one arm that separates it from its pair
  status TEXT NOT NULL DEFAULT 'untested' CHECK (status IN ('untested','supported','refuted','inconclusive'))
);

-- WHAT THE OWN CORPUS CANNOT ANSWER. One row per axis, naming the variance the
-- axis actually has in the corpus rather than the variance the question needs.
CREATE TABLE IF NOT EXISTS confound_audit (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  axis TEXT NOT NULL,                        -- e.g. 'item identity'
  question_it_must_answer TEXT NOT NULL,
  observed_variance TEXT NOT NULL,           -- what the corpus actually varies
  needed_variance TEXT NOT NULL,             -- what the question requires
  verdict TEXT NOT NULL CHECK (verdict IN ('answerable','saturated','absent','confounded')),
  evidence TEXT NOT NULL,
  corpus TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS falsified (
  id TEXT PRIMARY KEY,
  investigation_id TEXT NOT NULL REFERENCES investigations(id),
  claim TEXT NOT NULL,
  source_investigation TEXT NOT NULL,
  verdict TEXT NOT NULL,
  do_not_rebuild TEXT NOT NULL
);