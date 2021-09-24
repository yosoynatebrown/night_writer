class FileWriter

  def initialize(write_path, text_string)
    @write_path = write_path
  end

  def write_to_file(text_string)
    File.open(@write_path, 'w') do |f|
      f.write(text_string)
    end
  end
end
