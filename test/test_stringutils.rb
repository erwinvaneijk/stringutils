require "test/unit"
require "stringutils"

class TestStringutils < Test::Unit::TestCase
  def test_nullcase
    assert_equal "".hexify, ""
    assert_equal "".dottify, ""
  end

  def test_sanity
    assert "foo".hexify == "666f6f"
    assert "foo".dottify == "foo"
  end

  def test_replacement
    assert_equal "foo\000\000".hexify, "666f6f0000"
    assert_equal "foo\000\000".dottify, "foo.."
    assert_equal "foo\000\000foo".hexify, "666f6f0000666f6f"
    assert_equal "foo\000\000foo".dottify, "foo..foo"
    assert_equal "bar".hexify, "626172"
  end

  def test_all_funny
    assert_equal ("\000"*10).hexify, "00"*10
    assert_equal ("\x10"*10).hexify, "10"*10
    assert_equal ("\x10"*10).dottify, "."*10
  end
end
