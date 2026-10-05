# Sinosphere Atlas

Exploring the roots, overlaps and distinctions between Chinese, Japanese, Korean and Vietnamese (the Sinosphere) by loading the Unicode Unihan database into SQL, modelling sound correspondences with interpretable ML, comparing words with embeddings, and visualizing the results.

## Goals
1. Load Unihan into a relational database and query cross-language readings.
2. Learn Middle Chinese / Mandarin -> Sino-Korean / Sino-Japanese reading rules with interpretable models.
3. Find cognates and false friends with multilingual embeddings.
4. Visualize characters, variants and sound shifts (graphs, UMAP, Sankey).
5. Accelerate hot paths in C (alignment / edit distance) via ctypes.

## Quick start
```bash
python -m venv .venv && source .venv/bin/activate
pip install -e ".[dev]"
python scripts/download_unihan.py
python -m sinosphere.ingest
pytest
```

## Layout
- `src/sinosphere/` Python package (ingest, db, features, models, viz)
- `c/` C kernels (edit distance)
- `sql/schema.sql` database schema
- `docs/PLAN.md` phased checklist (source of truth for progress)
- `AGENTS.md` instructions for AI coding agents (Codex, Antigravity, Claude, Copilot)
- `data/` raw and processed data (git-ignored)

## Data and licensing
Unihan data is provided by the Unicode Consortium under the Unicode license; it is downloaded at runtime and not committed. Code is MIT licensed (add a LICENSE file).

## Caveats
Unihan coverage varies by language (Vietnamese and Korean are sparser than Mandarin). Identical characters can have diverging meanings. Report coverage honestly.
