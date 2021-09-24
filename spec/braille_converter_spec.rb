require "rspec"
require "./lib/braille_converter"

describe BrailleConverter do
  before(:each) do
  @braille_converter = BrailleConverter.new("")
  end
  it 'exists' do
  expect(@braille_converter).to be_a(BrailleConverter)
  end

end
