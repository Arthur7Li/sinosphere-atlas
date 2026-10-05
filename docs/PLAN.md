# Plan

Source of truth for progress. Agents: complete one unchecked task per PR, lowest phase first.

## Phase 0: Setup
- [x] Repo scaffold, AGENTS.md, CI
- [x] Add MIT LICENSE
- [ ] `scripts/download_unihan.py` downloads and unzips Unihan into `data/raw/`

## Phase 1: Ingest and database
- [ ] Parse Unihan_Readings.txt, Unihan_Variants.txt, Unihan_DictionaryLikeData into pandas
- [ ] Create SQLite schema from `sql/schema.sql`
- [ ] Load tables; report per-language coverage
- [ ] Write 10 showcase SQL queries in `sql/queries/` (e.g. chars with Korean+Japanese+Vietnamese readings; variant chains)

## Phase 2: Reading correspondences
- [ ] Normalize romanizations (Pinyin, Hangul RR, Japanese on'yomi, Quoc ngu) into comparable initial/final units
- [ ] Build correspondence table per language pair with counts
- [ ] Reproduce a known sound law from the data (e.g. Middle Chinese labial initials) and document it

## Phase 3: Interpretable ML
- [ ] Decision tree predicting Sino-Korean/Sino-Japanese reading from Mandarin features
- [ ] Cross-validated metrics, exported readable rules
- [ ] List of rule-breaking characters with analysis (loan layers, later borrowings)
- [ ] Clustering of characters by reading profile

## Phase 4: Words and embeddings
- [ ] Choose a multilingual embedding model and a small CJK word list
- [ ] Compute similarity for shared-character words
- [ ] Rank false friends and cognates; manually validate a sample

## Phase 5: C kernel
- [ ] `c/edit_distance.c` + Makefile
- [ ] ctypes binding with Python fallback and equivalence tests
- [ ] Benchmark vs pure Python

## Phase 6: Visualization
- [ ] Variant/phonetic-component graph with centrality
- [ ] UMAP map of characters colored by reading similarity
- [ ] Sankey: Middle Chinese initials -> Mandarin / Korean / Japanese / Vietnamese
- [ ] Optional interactive web view (React + TypeScript)

## Open questions
- Middle Chinese source beyond Unihan (e.g. Baxter-Sagart, Guangyun-based data)?
- Which word lists / corpora to use for Phase 4?
