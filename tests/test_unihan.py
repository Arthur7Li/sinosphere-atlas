from sinosphere.unihan import codepoint_to_glyph


def test_codepoint_to_glyph():
    assert codepoint_to_glyph("U+4E2D") == "\u4e2d"
