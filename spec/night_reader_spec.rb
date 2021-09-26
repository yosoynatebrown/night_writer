require_relative 'spec_helper.rb'
require "rspec"
require "./lib/night_reader"

describe NightReader do
  before(:each) do
  @reader = NightReader.new('./hello_world.txt')
  end

  it 'exists' do
  expect(@reader).to be_a(NightReader)
  end

  it '#read_chars' do
    allow(File).to receive(:read).and_return("hello world\nhello world")
    expect(@reader.read_chars).to eq('hello worldhello world')
  end

  it '#read_braille' do
    input = ["0.0.0.0.0....00.0.0.000.0.0.0.0....00.0.0.00\n",
 "00.00.0..0..00.0000..000.00.0..0..00.0000..0\n",
 "....0.0.0....00.0.0.......0.0.0....00.0.0...\n"]
    output = ["0.0.0.0.0....00.0.0.000.0.0.0.0....00.0.0.00",
 "00.00.0..0..00.0000..000.00.0..0..00.0000..0",
 "....0.0.0....00.0.0.......0.0.0....00.0.0..."]
    allow(File).to receive(:readlines).and_return(input)
    expect(@reader.read_braille).to eq(output)
  end
end
