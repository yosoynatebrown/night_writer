require_relative 'spec_helper.rb'
require "rspec"
require "./lib/braille_converter"

describe BrailleConverter do
  before(:each) do
  @line_array = ["..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..",
"..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......",
"..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0",
"00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..",
".0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..",
"...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0",
"00..00..0.",
".....0...0",
"00.000.000"]
  @braille_converter = BrailleConverter.new(@line_array)
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

  it '#convert_lines_to_letters' do
    expect(@braille_converter.convert_lines_to_letters.length).to eq(3)
    expect(@braille_converter.convert_lines_to_letters[0][0]).to eq(["..", "..", ".."])
  end

  it '#convert_indicator_chars' do
    input = " !',-.?abcdefghijklmnopqrstuvwxyz;a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z"
    expected = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    expect(@braille_converter.convert_indicator_chars(input)).to eq(expected)
  end

  it '#convert_to_chars' do
   expect(@braille_converter.convert_to_chars).to eq(" !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
  end
end
