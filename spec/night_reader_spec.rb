require "rspec"
require "./lib/night_reader"

describe NightReader do
  before(:each) do
  @reader = NightReader.new('./hello_world.txt')
  end

  it 'exists' do
  expect(@reader).to be_a(NightReader)
  end

  it '#read_text' do
    expect(@reader.read_text).to eq('hello world')
  end
end
