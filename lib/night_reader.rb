class NightReader

  def initialize(path)
    @path = path
  end

  def read_chars
    lines = File.read(@path)
    lines.gsub("\n", "")
  end

  def read_braille
    lines = File.readlines(@path)
    lines.each do |line|
      line.gsub!("\n", "")
    end
  end
end
