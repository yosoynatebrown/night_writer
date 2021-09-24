class NightReader

  def initialize(path)
    @path = path
  end

  def read_text
    lines = File.read(@path)
    lines.gsub("\n", "")
  end
end
