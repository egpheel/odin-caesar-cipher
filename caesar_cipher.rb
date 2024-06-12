# Caesar Cipher by Eduardo Gil - An assignment for The Odin Project

def caesar_cipher(text = '', shift = 0)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  split_text = text.chars
  new_text = []

  split_text.each do |letter|
    if alphabet.include?(letter.downcase)
      index = wrap_around_number(alphabet.index(letter.downcase) + shift, 0, alphabet.length - 1)
      letter == letter.upcase ? new_text.push(alphabet[index].upcase) : new_text.push(alphabet[index])
    else
      new_text.push(letter)
    end
  end

  p new_text.join
end

def wrap_around_number(number = 0, min = 0, max = 26)
  output = number

  if number > max || number < min
    for i in 0..(number.abs)
      number < 0 ? output -= 1 : output += 1

      output = min if output > max
      output = max + 1 if output < min
    end
  end

  output
end

caesar_cipher('What a string!', 5)
