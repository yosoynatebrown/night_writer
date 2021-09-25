require_relative 'char_lookupable'
require "prettyprint"

class BrailleConverter
include CharLookupable
  attr_reader :converted
  def initialize(line_array)
    @converted = convert_to_chars(line_array)
  end

  def convert_to_chars(line_array)
    # braille_row_count = line_array.length / 3

    double_character_array = line_array.map do |line, array|
      line.chars.each_slice(2).map(&:join)
    end

    arrays_by_rows = double_character_array.each_slice(3).to_a
    transposed_array = []
    arrays_by_rows.each do |array|
      transposed_array << array.transpose
    end
    require "pry"; binding.pry
  end
end
