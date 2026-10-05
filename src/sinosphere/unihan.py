"""Parsing helpers for Unihan tab-separated files."""

from __future__ import annotations

from pathlib import Path

import pandas as pd


def read_unihan_file(path: Path) -> pd.DataFrame:
    """Read a Unihan_*.txt file into columns: codepoint, field, value."""
    rows = []
    with path.open(encoding="utf-8") as f:
        for line in f:
            if not line.strip() or line.startswith("#"):
                continue
            parts = line.rstrip("\n").split("\t", 2)
            if len(parts) == 3:
                rows.append(parts)
    return pd.DataFrame(rows, columns=["codepoint", "field", "value"])


def codepoint_to_glyph(codepoint: str) -> str:
    """Convert 'U+4E2D' to the character itself."""
    return chr(int(codepoint.removeprefix("U+"), 16))
