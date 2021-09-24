class CharConverter
  attr_reader :braille
  def initialize(string)
    @braille = convert_to_braille(string)
  end

  def punctuation_hash
    {
     " "=>["..", "..", ".."],
     "!"=>["..", "00", "0."],
     "'"=>["..", "..", "0."],
     ","=>["..", "0.", ".."],
     "-"=>["..", "..", "00"],
     "."=>["..", "00", ".0"],
     "?"=>["..", "0.", "00"]
   }
  end

  def lower_case_hash
    {
      "a"=>["0.", "..", ".."],
     "b"=>["0.", "0.", ".."],
     "c"=>["00", "..", ".."],
     "d"=>["00", ".0", ".."],
     "e"=>["0.", ".0", ".."],
     "f"=>["00", "0.", ".."],
     "g"=>["00", "00", ".."],
     "h"=>["0.", "00", ".."],
     "i"=>[".0", "0.", ".."],
     "j"=>[".0", "00", ".."],
     "k"=>["0.", "..", "0."],
     "l"=>["0.", "0.", "0."],
     "m"=>["00", "..", "0."],
     "n"=>["00", ".0", "0."],
     "o"=>["0.", ".0", "0."],
     "p"=>["00", "0.", "0."],
     "q"=>["00", "00", "0."],
     "r"=>["0.", "00", "0."],
     "s"=>[".0", "0.", "0."],
     "t"=>[".0", "00", "0."],
     "u"=>["0.", "..", "00"],
     "v"=>["0.", "0.", "00"],
     "w"=>[".0", "00", ".0"],
     "x"=>["00", "..", "00"],
     "y"=>["00", ".0", "00"],
     "z"=>["0.", ".0", "00"]
   }
  end

  def braille_hash
    upcase_hash = Hash.new([])

    lower_case_hash.each do |char, array|
      upcase_hash[char.upcase] = ".." + array[0], ".." + array[1], ".0" + array[2]
    end

    punctuation_hash.merge(lower_case_hash.merge(upcase_hash))
  end

  def convert_to_braille(string)
    values_array = string.chars.map do |char|
      braille_hash[char]
    end
    line1 = ""
    line2 = ""
    line3 = ""
    values_array.each do |array|
      line1 += array[0]
      line2 += array[1]
      line3 += array[2]
    end

    if line1.length < 81
      line1 += "\n"
      line2 += "\n"
      full_string = line1 + line2 + line3
    else
      first_line = line1[0..79] + '\n' + line2[0..79] + '\n' + line3[0..79] + '\n'
      full_string = first_line
      number_of_wraps = (line1.length / 80)

      number_of_wraps.times do |num|
        num = num + 1
        full_string += line1[(80 * num)..((80 * (num + 1)) - 1)] + "\n" + line2[(80 * num)..((80 * (num + 1)) - 1)] + "\n" + line3[(80 * num)..((80 * (num + 1)) - 1)]  + "\n"
      end
      full_string.gsub("\\n", "\n")
    end
  end

end
