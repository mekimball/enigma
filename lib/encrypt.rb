require './lib/enigma'

enigma = Enigma.new
file = File.open("message.txt", "r")
file.each do |info|
  info.each_line do |line|
    File.open("encrypted.txt", "w") { |f| f.write enigma.encrypt(line.chomp)}
    p "created '#{File.basename(file)}' with key #{enigma.encrypt(line.chomp)[:key]} and date #{enigma.encrypt(line.chomp)[:date]}"
  end
end
