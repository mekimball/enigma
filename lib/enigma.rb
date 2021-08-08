class Enigma
  attr_reader :available

  def initialize
    @available = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encrypt = {encryption: nil, key: key, date: date}
    new = []
    split = message.chars
    new_shift = shifts(key, date)
    positions = split.map do |letter|
        available.index(letter)
    end
    positions.each do |position|
      new_shift.each do |shift|
        unless positions.length == 0
          new << available.rotate(shift)[positions.shift]
          encrypt[:encryption] = new.join
        end
      end
    end
    encrypt
  end

  def decrypt(message, key, date)
    decrypt = {decryption: nil, key: key, date: date}
    new = []
    split = message.chars
    new_shift = shifts(key, date)
    positions = split.map do |letter|
        available.index(letter)
    end
    positions.each do |position|
      new_shift.each do |shift|
        unless positions.length == 0
          new << available.rotate(-shift)[positions.shift]
          decrypt[:decryption] = new.join
        end
      end
    end
    decrypt
  end

  def shifts(key, date)
    [key[0..1].to_i + square_date(date)[0].to_i,
    key[1..2].to_i + square_date(date)[1].to_i,
    key[2..3].to_i + square_date(date)[2].to_i,
    key[3..4].to_i + square_date(date)[3].to_i]
  end

  def square_date(date = time.strftime("%d%m%y"))
    (date.to_i ** 2).to_s[-4..-1].to_s
  end
end
