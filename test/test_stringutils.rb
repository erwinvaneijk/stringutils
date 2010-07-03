require "test/unit"
require "stringutils"

class TestStringutils < Test::Unit::TestCase
  def test_nullcase
    assert_equal "".hexify, ""
    assert_equal "".dottify, ""
    assert_equal "".to_binary, ""
  end

  def test_sanity
    assert "foo".hexify == "666f6f"
    assert "foo".dottify == "foo"
    assert "foo".to_binary == ""
  end

  def test_replacement
    assert_equal "foo\000\000".hexify, "666f6f0000"
    assert_equal "foo\000\000".dottify, "foo.."
    assert_equal "foo\000\000foo".hexify, "666f6f0000666f6f"
    assert_equal "foo\000\000foo".dottify, "foo..foo"
    assert_equal "bar".hexify, "626172"
  end

  def test_to_binary
    assert_equal "dead".to_binary, "\xde\xad"
    assert_equal "101010".to_binary, "\x10\x10\x10"
  end
  
  def test_all_funny
    assert_equal ("\000"*10).hexify, "00"*10
    assert_equal ("\x10"*10).hexify, "10"*10
    assert_equal ("\x01"*10).hexify, "01"*10
    assert_equal ("\x10"*10).dottify, "."*10
  end
  
  def test_string_digest
    x = StringDigest.new("0000111122223333aaaaffff")
    assert_equal x.beautify, "0000 1111 2222 3333 aaaa ffff"
    x = StringDigest.new("0000 1111 2222 3333 aaaa ffff")
    assert_equal x.beautify, "0000 1111 2222 3333 aaaa ffff"
    
    assert_raise(InvalidDigestException) {
      x = StringDigest.new("0000111122223333aaaaff")
      ignore = x.beautify
    }
    
    assert_raise(InvalidDigestException) {
      x = StringDigest.new("0000 1111 2222 3333 aaaa ff")
      ignore = x.beautify
    }
    
    assert_raise(InvalidDigestException) {
      x = StringDigest.new("all wrong")
      ignore = x.beautify
    }
  end
end
