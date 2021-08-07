class Enigma


  def encrypt(message, key, date)
    positions = []
    split = message.chars
    split.each do |letter|
      positions << available.index(letter)
    end
    positions.each do |position|
      require "pry"; binding.pry
    end
  end

  def available
    ("a".."z").to_a << " "
  end

  def a_key(key, date)
    a_key = key[0..1].to_i + square_date(date)[0]
  end

  def b_key(key, date)
    b_key = key[1..2].to_i + square_date(date)[1]
  end

  def c_key(key, date)
    c_key = key[2..3].to_i + square_date(date)[2]
  end

  def d_key(key, date)
    d_key = key[3..4].to_i + square_date(date)[3]
  end

  def square_date(date)
  square_date = (date.to_i ** 2).to_s[-4..-1].to_i
  end

end
