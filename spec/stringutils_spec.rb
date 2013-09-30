# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'shoulda'
require 'stringutils'

describe String do
  it "handle empty strings right" do
    "".hexify.should eql("")
    "".dottify.should eql("")
    "".to_binary.should eql("")
  end

  it "should replace non-ascii text properly" do

    "foo\000\000".hexify.should eql "666f6f0000"
    "foo\000\000".dottify.should eql "foo.."
    "foo\000\000foo".hexify.should eql "666f6f0000666f6f"
    "foo\000\000foo".dottify.should eql "foo..foo"
    "bar".hexify.should eql "626172"
  end

  it "should do binary conversions" do
    "101010".to_binary.should eql "\x10\x10\x10"
    "dead".to_binary.bytes.should eql [222, 173]
  end

  it "should handle all the same right" do
    ("\000"*10).hexify.should eql "00"*10
    ("\x10"*10).hexify.should eql "10"*10
    ("\x01"*10).hexify.should eql "01"*10
    ("\x10"*10).dottify.should eql "."*10
  end
end

