require "rspec"
require "./lib/char_converter"

describe CharConverter do
  before(:each) do
  @converter = CharConverter.new("Z")
  end
  it 'exists' do
  expect(@converter).to be_a(CharConverter)
  end

  it "has a braille hash" do
    expect(@converter.braille_hash).to be_a(Hash)
  end

  it "has the right number of characters total" do
    expect(@converter.braille_hash.count).to eq(59)
  end
end
