class CharConverter


  def initialize(english_char)
    @english_char = english_char
    @braille_char = ""
  end

  def braille_hash
    punctuation_hash = {
      " " => "",
      "!" => "",
      "''" => "",
      "," => "",
      "-" => "",
      "." => "",
      "?" => ""
    }

    lower_case_hash = {
      "a" => "",
      "b" => "",
      "c" => "",
      "d" => "",
      "e" => "",
      "f" => "",
      "g" => "",
      "h" => "",
      "i" => "",
      "j" => "",
      "k" => "",
      "l" => "",
      "m" => "",
      "n" => "",
      "o" => "",
      "p" => "",
      "q" => "",
      "r" => "",
      "s" => "",
      "t" => "",
      "u" => "",
      "v" => "",
      "w" => "",
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
