def echo(str)
  return str
end

def shout(str)
  return str.upcase
end

def repeat(str, count=2)
  final = []
  (1..count).each {final.push(str)}
  return final.join(" ")
end 

def start_of_word(str, count)
  return str[0..(count - 1)]
end

def first_word(str)
  arr = str.split(" ")
  return arr[0]
end

def titleize(str)
  littleWords = ["the", "and", "over", "at", "of", "a"]
  arr = str.split(" ")
  arr.each do |word| 
    unless littleWords.include?(word) && arr.index(word) != 0
      word.capitalize!
    end
  end
  return arr.join(" ")
end

