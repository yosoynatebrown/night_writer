require_relative 'spec_helper.rb'
require "rspec"
require "./lib/char_converter"

describe CharConverter do
  before(:each) do
  @converter = CharConverter.new("hello world")
  end
  it 'exists' do
  expect(@converter).to be_a(CharConverter)
  end

  it '#punctuation_hash' do
    expect(@converter.punctuation_hash).to be_a(Hash)
    expect(@converter.punctuation_hash[" "]).to eq(["..", "..", ".."])
  end

  it '#lower_case_hash' do
    expect(@converter.lower_case_hash).to be_a(Hash)
    expect(@converter.lower_case_hash["h"]).to eq(["0.", "00", ".."])
    expect(@converter.lower_case_hash["e"]).to eq(["0.", ".0", ".."])
    expect(@converter.lower_case_hash["l"]).to eq(["0.", "0.", "0."])
  end

  it "has a braille hash" do
    expect(@converter.braille_hash).to be_a(Hash)
  end

  it "braille hash the right number of characters total" do
    expect(@converter.braille_hash.count).to eq(69)
  end

  it "#lookup_chars" do
    expected = [["0.", "00", ".."],
                ["0.", ".0", ".."],
                ["0.", "0.", "0."],
                ["0.", "0.", "0."],
                ["0.", ".0", "0."],
                ["..", "..", ".."],
                [".0", "00", ".0"],
                ["0.", ".0", "0."],
                ["0.", "00", "0."],
                ["0.", "0.", "0."],
                ["00", ".0", ".."]]
    expect(@converter.lookup_chars).to eq(expected)
  end

  it "#format_to_lines" do
    expect(@converter.format_to_lines).to be_a(Hash)
    expect(@converter.format_to_lines[:line1].length).to eq(22)
  end

  it "#format_to_lines" do
    @converter = CharConverter.new(" !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    expect(@converter.wrapping(@converter.format_to_lines)).to be_a(String)
    expect(@converter.wrapping(@converter.format_to_lines).length).to eq(522)
  end

  it "#convert_to_braille" do
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."

    expect(@converter.convert_to_braille).to eq(expected)
  end
end
