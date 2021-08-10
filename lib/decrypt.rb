require './lib/enigma'
require './lib/encrypt'

enigma = Enigma.new
file = File.open("encrypted.txt", "r")
file.each do |info|
  info.each_line do |line|
    # require "pry"; binding.pry
    File.open("decrypted.txt", "w") { |f| f.write enigma.decrypt(line.chomp, @key, @date)}
    p "created 'decrypted.txt' with key #{@key} and date #{@date}"
  end
end
