require "rspec"
require "./lib/night_reader"

describe NightReader do
  before(:each) do
  @reader = NightReader.new('./hello_world.txt')
  end

  it 'exists' do
  expect(@reader).to be_a(NightReader)
  end

  xit '#read_text' do
    expect(@reader.read_chars).to eq('hello worldhello world')
  end
end
