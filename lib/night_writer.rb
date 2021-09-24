require_relative 'night_reader'
require_relative 'file_writer'
require_relative 'char_converter'

path_array = ARGV


reader = NightReader.new(path_array[0])
text = reader.read_text

converter = CharConverter.new(text)

writer = FileWriter.new(path_array[1], converter.braille)
writer.write_to_file

lines = File.readlines(path_array[1])
text = lines.join
char_count = text.length

puts "Created #{path_array[1]} containing #{char_count} characters"
