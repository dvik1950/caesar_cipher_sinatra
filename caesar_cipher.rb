require 'sinatra'
require 'sinatra/reloader'

def cipher(words,number)
  unless words == nil
   words_array = words.split('+')
   new_words_array = []
  words_array.each do |word|
    new_words_array.push(cipher_word(word,number))
  end
  return new_words_array.join(" ")
  end
end


def cipher_word(word, number)
  word_array = word.split('')
  new_word = []
  word_array.each do |i|
    new_word.push(cipher_letter(i,number))
  end
  return new_word.join('')
end

def cipher_letter(letter,number)
  number = number.to_i
   if number > 26
     number = number % 26
   end
  all_letters = ('a'..'z').to_a
  all_letters.each_with_index do |one_letter,index|
    if one_letter == letter
      if index + number <= 25
        return all_letters[number + index]
      else
        return all_letters[number + index - 26]
      end
    end
  end
  return letter
  end



get '/' do
  to_cipher = params["value_to_cipher"]
  number_to_cipher = params["number_to_cipher"]
  outpt = cipher(to_cipher,number_to_cipher)
  erb :index, :locals => {:outpt => outpt}

end

