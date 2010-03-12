=begin rdoc
StringUtils is a package that adds some useful routines to the already
packed String class. I know this kind of behaviour is frowned upon,
but it feels too natural to say "s".dottify when debugging binary
stuff.
=end
class StringUtils
  VERSION = '1.0.0'
end

class String
  # Convert the string into the hex-equivalent. 
  # Useful for debugging.
  def hexify
    s = ""
    self.each_byte do |c|
      s << c.ord.to_s(16).ljust(2,"0")
    end
    s
  end

  #Convert the string into the equivalent with all the
  #non-printables converted to '.'
  def dottify
    self.gsub(/[^[:print:]]/, ".")
  end
end
