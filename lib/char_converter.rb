class CharConverter

  def initialize(english_char)
    @english_char = english_char
    @braille_char = ""
  end

  def punctuation_hash
    {
    " " => "..\n..\n..",
    "!" => "..\n00\n0.",
    "''" => "..\n..\n0.",
    "," => "..\n0.\n..",
    "-" => "..\n..\n00",
    "." => "..\n00\n.0",
    "?" => "..\n0.\n00"
  }
  end

  def lower_case_hash
    {
    "a" => "0.\n..\n..",
    "b" => "0.\n0.\n..",
    "c" => "00\n..\n..",
    "d" => "00\n.0\n..",
    "e" => "0.\n.0\n..",
    "f" => "00\n0.\n..",
    "g" => "00\n00\n..",
    "h" => "0.\n00\n..",
    "i" => ".0\n0.\n..",
    "j" => ".0\n00\n..",
    "k" => "0.\n..\n0.",
    "l" => "0.\n0.\n0.",
    "m" => "00\n..\n0.",
    "n" => "00\n.0\n0.",
    "o" => "0.\n.0\n0.",
    "p" => "00\n0.\n0.",
    "q" => "00\n00\n0.",
    "r" => "0.\n00\n0.",
    "s" => ".0\n0.\n0.",
    "t" => ".0\n00\n0.",
    "u" => "0.\n..\n00",
    "v" => "0.\n0.\n00",
    "w" => ".0\n00\n.0",
    "x" => "00\n..\n00",
    "y" => "00\n.0\n00",
    "z" => "0.\n.0\n00"
  }
  end

  def braille_hash
  upcase_hash = Hash.new("")

  lower_case_hash.each do |char, string|
    upcase_hash[char.upcase] = "..\n..\n.0\n" + string
  end

  punctuation_hash.merge(lower_case_hash.merge(upcase_hash))
  end

end
