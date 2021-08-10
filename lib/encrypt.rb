require './lib/enigma'

enigma = Enigma.new
file = File.open("message.txt", "r")
file.each do |info|
  info.each_line do |line|
    @key = enigma.encrypt(line.chomp)[:key]
    @date = enigma.encrypt(line.chomp)[:date]
    File.open("encrypted.txt", "w") { |f| f.write enigma.encrypt(line.chomp)[:encryption]}
    p "created 'encrypted.txt' with key #{@key} and date #{@date}"
  end
end
