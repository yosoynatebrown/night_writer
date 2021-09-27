require_relative 'spec_helper.rb'
require "rspec"
require "./lib/file_io"

describe FileWriter do
  before(:each) do
  @file_writer = FileWriter.new("./hello_world.txt", "hello world\nhello world")
  end
  it 'exists' do
  expect(@file_writer).to be_a(FileWriter)
  end

  it "#write_to_file" do
    @file_writer.write_to_file
    expect(lines = File.read("./hello_world.txt")).to eq("hello world\nhello world")
  end
end
