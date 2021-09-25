require "braille_lookupable.rb"

class CharConverter
  include BrailleLookupable
  attr_reader :converted
  def initialize(string)
    @converted = convert_to_braille(string)
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
