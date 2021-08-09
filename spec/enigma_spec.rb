require 'simplecov'
SimpleCov.start
require 'date'
require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it "can encrypt" do
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    expect(enigma.encrypt("hello world", "02715", "040895" )).to eq(expected)
  end

  it "can decrypt" do
    enigma = Enigma.new
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it "can encrypt with today's date" do
    enigma = Enigma.new
    expected = {
                encryption: "nefau qdxly",
                key: "02715",
                date: Time.now.strftime("%d%m%y")
              }
    expect(enigma.encrypt("hello world", "02715")).to eq(expected)
  end

  it "can decrypt with today's date" do
    enigma = Enigma.new
    expected = {
                decryption: "hello world",
                key: "02715",
                date: Time.now.strftime("%d%m%y")
              }
    expect(enigma.decrypt("nefau qdxly", "02715")).to eq(expected)
  end
end
