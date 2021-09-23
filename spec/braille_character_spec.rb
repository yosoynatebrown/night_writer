require "rspec"
require "./lib/braille_character"

describe BrailleCharacter do
  before(:each) do
  @braille_character = BrailleCharacter.new(english_char)
  end
  it 'exists' do
  expect(@braille_character).to be_a(BrailleCharacter)
  end

  it 'attributes' do
    expect(@braille_character.name).to eq()
  end
end
