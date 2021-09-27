require_relative "braille_lookupable.rb"

class CharConverter
  include BrailleLookupable
  attr_reader :converted
  def initialize(string)
    @string = string
    @converted = convert_to_braille
  end

  def lookup_chars
    @string.chars.map do |char|
      braille_hash[char]
    end
  end

  def format_to_lines
    line1 = ""
    line2 = ""
    line3 = ""
    lookup_chars.each do |array|
      line1 += array[0]
      line2 += array[1]
      line3 += array[2]
    end
    line_hash = Hash.new
    line_hash[:line1] = line1
    line_hash[:line2] = line2
    line_hash[:line3] = line3
    line_hash
  end

  def wrapping(line_hash)
    line1 = line_hash[:line1]
    line2 = line_hash[:line2]
    line3 = line_hash[:line3]
    full_string = line1[0..79] + '\n' + line2[0..79] + '\n' + line3[0..79] + '\n'
    number_of_wraps = (line1.length / 80)

    number_of_wraps.times do |num|
      num = num + 1
      full_string += line1[(80 * num)..((80 * (num + 1)) - 1)] + "\n" + line2[(80 * num)..((80 * (num + 1)) - 1)] + "\n" + line3[(80 * num)..((80 * (num + 1)) - 1)]  + "\n"
    end
    full_string
  end

  def convert_to_braille
    line1 = format_to_lines[:line1]
    line2 = format_to_lines[:line2]
    line3 = format_to_lines[:line3]
    if line1.length < 81
      line1 += "\n"
      line2 += "\n"
      full_string = line1 + line2 + line3
    else
      full_string = wrapping(format_to_lines)
    end
      full_string.gsub("\\n", "\n")
  end

end
