# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'stringutils'

describe StringDigest do
  it "should beautify properly formatted hexadecimal strings" do
    x = StringDigest.new("0000111122223333aaaaffff")
    x.beautify.should eql "0000 1111 2222 3333 aaaa ffff"

    x = StringDigest.new("0000 1111 2222 3333 aaaa ffff")
    x.beautify.should eql "0000 1111 2222 3333 aaaa ffff"

  end

  it "should reject improperly formatted strings" do
    x = StringDigest.new("0000111122223333aaaaff")
    lambda {x.beautify}.should raise_error(InvalidDigestException)

    x = StringDigest.new("0000 1111 2222 3333 aaaa ff")
    lambda {x.beautify}.should raise_error InvalidDigestException

    x = StringDigest.new("all wrong")
    lambda {x.beautify}.should raise_error InvalidDigestException
  end
end

