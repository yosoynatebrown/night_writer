require "rspec"
require "./lib/file_writer"

describe FileWriter do
  before(:each) do
  @file_writer = FileWriter.new("./braille.txt", "Yo")
  end
  it 'exists' do
  expect(@file_writer).to be_a(FileWriter)
  end

  it "#write_to_file" do
    @file_writer.write_to_file("Yo")
    expect(lines = File.read("./braille.txt")).to eq("Yo")
  end
end
