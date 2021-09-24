class CharConverter


  def initialize(english_char)
    @english_char = english_char
    @braille_char = ""
  end

  def braille_hash
    punctuation_hash = {
      " " => "..\n..\n..",
      "!" => "..\n00\n0.",
      "''" => "..\n..\n0.",
      "," => "..\n0.\n..",
      "-" => "..\n..\n00",
      "." => "..\n00\n.0",
      "?" => "..\n0.\n00"
    }

    lower_case_hash = {
      "a" => "0.\n..\n..",
      "b" => "0.\n0.\n..",
      "c" => "",
      "d" => "00\n.0\n..",
      "e" => "0.\n.0\n..",
      "f" => "",
      "g" => "",
      "h" => "0.\n00\n..",
      "i" => "",
      "j" => "",
      "k" => "",
      "l" => "0.\n0.\n0.",
      "m" => "",
      "n" => "",
      "o" => "0.\n.0\n0.",
      "p" => "",
      "q" => "",
      "r" => "0.\n00\n0.",
      "s" => "",
      "t" => "",
      "u" => "",
      "v" => "",
      "w" => ".0\n00\n.0",
      "x" => "",
      "y" => "",
      "z" => ""
    }

  upcase_hash = Hash.new("")

  lower_case_hash.each do |char, string|
    upcase_hash[char.upcase] = "..\n..\n.0\n" + string
  end

  punctuation_hash.merge(lower_case_hash.merge(upcase_hash))
  end

end
