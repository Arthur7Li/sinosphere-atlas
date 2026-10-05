PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS character (
  codepoint TEXT PRIMARY KEY,      -- e.g. 'U+4E2D'
  glyph TEXT NOT NULL,
  total_strokes INTEGER,
  radical INTEGER,
  definition TEXT
);

CREATE TABLE IF NOT EXISTS reading (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  codepoint TEXT NOT NULL REFERENCES character(codepoint),
  lang TEXT NOT NULL,              -- mandarin, cantonese, japanese_on, japanese_kun, korean, vietnamese, tang
  system TEXT NOT NULL,            -- pinyin, jyutping, hangul, quoc_ngu, ...
  value TEXT NOT NULL,
  UNIQUE (codepoint, lang, system, value)
);
CREATE INDEX IF NOT EXISTS idx_reading_lang ON reading(lang);

CREATE TABLE IF NOT EXISTS variant (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  codepoint TEXT NOT NULL REFERENCES character(codepoint),
  related TEXT NOT NULL,
  type TEXT NOT NULL               -- simplified, traditional, semantic, specialized_semantic, z_variant
);
CREATE INDEX IF NOT EXISTS idx_variant_type ON variant(type);
