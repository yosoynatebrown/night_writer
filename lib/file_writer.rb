
class FileWriter

  def initialize(write_path, text_string)
    @write_path  = write_path
    @text_string = text_string
  end

  def write_to_file
    File.open(@write_path, 'w') do |f|
      f.write(@text_string)
    end
  end
end
