require_relative 'char_lookupable'

class BrailleConverter
include CharLookupable
  attr_reader :converted
  def initialize(line_array)
    @converted = convert_to_chars(line_array)
  end

  def convert_indicator_chars(string)
    string.gsub!(/;([a-z])/, &:upcase)
    string.gsub!(";", "")
    num_letters = ('a'..'j').to_a
    num_letters.each do |letter|
    string.gsub!(/\##{letter}/, num_hash[letter])
    end
    string
  end

  def convert_to_chars(line_array)
    double_character_array = line_array.map do |line, array|
      line.chars.each_slice(2).map(&:join)
    end
    arrays_by_rows = double_character_array.each_slice(3).to_a
    transposed_array = arrays_by_rows.map do |array|
      array.transpose
    end
    final_string = ""
    transposed_array.each do |row|
      row.each do |letter|
        final_string << char_hash[letter]
      end
    end
    convert_indicator_chars(final_string)
  end
end
