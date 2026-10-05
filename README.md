# Sinosphere Atlas

Exploring the roots, overlaps and distinctions between Chinese, Japanese, Korean and Vietnamese (the Sinosphere) by loading the Unicode Unihan database into SQL, modelling sound correspondences with interpretable ML, comparing words with embeddings, and visualizing the results.

> Status: early scaffold. Progress is tracked in [docs/PLAN.md](docs/PLAN.md).

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
pytest
ruff check .
```

Planned (not implemented yet, see PLAN.md Phases 0-1): `python scripts/download_unihan.py` to fetch Unihan, then an ingest step to build the SQLite database.

## Layout
- `src/sinosphere/` Python package (currently the Unihan parser; ingest, features, models, viz are planned)
- `sql/schema.sql` database schema
- `docs/PLAN.md` phased checklist (source of truth for progress)
- `AGENTS.md` instructions for AI coding agents (Codex, Antigravity, Claude, Copilot)
- `data/` raw and processed data (git-ignored, created locally)
- `c/` C kernels (planned, Phase 5)

## Data and licensing
Unihan data is provided by the Unicode Consortium under the Unicode license; it is downloaded at runtime and not committed. Code is released under the [MIT License](LICENSE).

## Caveats
Unihan coverage varies by language (Vietnamese and Korean are sparser than Mandarin). Identical characters can have diverging meanings. Report coverage honestly.
