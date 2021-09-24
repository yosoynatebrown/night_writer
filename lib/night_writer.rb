require_relative 'night_reader'
require_relative 'file_writer'

path_array = ARGV


reader = NightReader.new(path_array[0])
text = reader.read_text

writer = FileWriter.new(path_array[1], text)
writer.write_to_file

lines = File.readlines(path_array[1])
text = lines.join
char_count = text.length

puts "Created #{path_array[1]} containing #{char_count} characters"
