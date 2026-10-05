# AGENTS.md

Instructions for AI coding agents (Codex, Antigravity, Claude Code, Copilot, Gemini). Read this file and `docs/PLAN.md` before doing anything.

## Project
Sinosphere Atlas: a CJKV character/reading analysis project (SQL + pandas + scikit-learn + embeddings + C kernel + visualization). Owner is a university CS student; prioritize clarity and learning value over cleverness.

## Workflow rules
1. Pick ONE unchecked task from `docs/PLAN.md` (lowest phase first). Do not start later phases early.
2. Work on a branch named `agent/<phase>-<short-task>`; never commit directly to `main`.
3. Make small, reviewable commits (conventional commits: feat, fix, docs, test, chore).
4. Write or update tests first/alongside code. Run `ruff check .`, `ruff format --check .` and `pytest` before finishing.
5. Open a PR describing what changed, how it was tested, and any open questions. Tick the task in `docs/PLAN.md` in the same PR.
6. If requirements are ambiguous, add a note under "Open questions" in the PR instead of guessing.

## Conventions
- Python 3.11+, type hints, docstrings on public functions, `src/` layout.
- SQL lives in `sql/`; use parameterized queries only.
- Use SQLite for development (`data/sinosphere.db`); keep SQL portable to Postgres.
- Random seeds fixed (`SEED = 42`); results must be reproducible.
- Keep ML models interpretable first (decision trees, logistic regression) before anything complex.
- C code: C11, no external deps, build with `make -C c`, bind via ctypes, with a pure-Python fallback and a test comparing both.

## Do not
- Commit raw data, `.db` files, API keys or secrets (use `.env`, git-ignored).
- Add heavy dependencies without noting the reason in the PR.
- Make claims about linguistic history that are not supported by data or a cited source; flag uncertainty.
- Rewrite unrelated files or reformat the whole repo.

## Definition of done
Tests pass, lint clean, docs updated, plan checkbox ticked, PR opened.
