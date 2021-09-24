require "rspec"
require "./lib/char_converter"

describe CharConverter do
  before(:each) do
  @converter = CharConverter.new("Z")
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
    require "pry"; binding.pry
    expect(@converter.braille_hash).to be_a(Hash)
  end

  it "braille hash the right number of characters total" do
    expect(@converter.braille_hash.count).to eq(59)
  end

  xit "#convert_to_braille" do
    expected = ""

    expect(@converter.convert_to_braille("hello world")).to eq(expected)
  end
end
