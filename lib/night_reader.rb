class NightReader

  def initialize(path)
    @path = path
  end

  def read_text
    lines = File.readlines(@path)
    lines[0].chomp
  end
end
