require_relative 'night_reader'
require_relative 'file_writer'
require_relative 'char_converter'
require_relative 'braille_converter'

path_array = ARGV


reader = NightReader.new(path_array[0])
text = reader.read_chars

# if text.count('.0') == text.size
  line_array = reader.read_braille
  converter = BrailleConverter.new(line_array)
# else
#   converter = CharConverter.new(text)
# end

writer = FileWriter.new(path_array[1], converter.converted)
writer.write_to_file

lines = File.readlines(path_array[1])
text = lines.join
char_count = text.length

puts "Created #{path_array[1]} containing #{char_count} characters"
