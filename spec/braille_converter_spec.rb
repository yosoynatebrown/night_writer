require_relative 'spec_helper.rb'
require "rspec"
require "./lib/braille_converter"

describe BrailleConverter do
  before(:each) do
  line_array = ["0.0.0.0.0....00.0.0.000.0.0.0.0....00.0.0.00",
 "00.00.0..0..00.0000..000.00.0..0..00.0000..0",
 "....0.0.0....00.0.0.......0.0.0....00.0.0..."]
  @braille_converter = BrailleConverter.new(line_array)
  end
  it 'exists' do
  expect(@braille_converter).to be_a(BrailleConverter)
  end

  it 'has a punctuation hash' do
    expect(@braille_converter.punctuation_hash[["..", "..", ".."]]).to eq(" ")
  end

  it 'has a lower case hash' do
    expect(@braille_converter.lower_case_hash[["00", "0.", ".."]]).to eq("f")
  end

  it 'has an upcase hash' do
    expect(@braille_converter.upcase_hash[["...0", "..00", ".0.."]]).to eq("J")
  end

  it 'has a char hash' do
    expect(@braille_converter.char_hash[["..", "..", "00"]]).to eq("-")
    expect(@braille_converter.char_hash[["00", "00", ".."]]).to eq("g")
    expect(@braille_converter.char_hash[["..0.", "..00", ".00."]]).to eq("R")
  end
end
