path_array = ARGV


NightReader.new(path_array[0])


lines = File.readlines(path_array[1])
text = lines.join
char_count = text.length

puts "Created #{path_array[1]} containing #{char_count} characters"
