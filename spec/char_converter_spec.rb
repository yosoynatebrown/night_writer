require "rspec"
require "./lib/char_converter"

describe CharConverter do
  before(:each) do
  @converter = CharConverter.new("Z")
  end
  it 'exists' do
  expect(@converter).to be_a(CharConverter)
  end

  xit "has a braille hash" do

  end
end
