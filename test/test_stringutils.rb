require "test/unit"
require "stringutils"

class TestStringutils < Test::Unit::TestCase
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
end
