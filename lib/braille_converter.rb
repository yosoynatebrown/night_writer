require_relative 'char_lookupable'

class BrailleConverter
include CharLookupable
  attr_reader :converted
  def initialize(line_array)
    @converted = convert_to_chars(line_array)
  end

  def convert_to_chars(line_array)
    line1 = line_array[0].chars.each_slice(2).map(&:join)
    line2 = line_array[1].chars.each_slice(2).map(&:join)
    line3 = line_array[2].chars.each_slice(2).map(&:join)
    require "pry"; binding.pry
  end
end
