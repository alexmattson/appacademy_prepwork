def translate(str)
  vowels = ["a", "e", "i", "o", "u"]
  arr = str.split(" ")
  final = []
  
  arr.each do |word|
    if vowels.include?(word[0])
     final.push(word + "ay")
    else
      first = []
      second = []
      vowelFound = false

      word.split("").each do |letter|
        if (vowels.include?(letter) && word[word.index(letter) - 1] != "q") || vowelFound 
          second.push(letter)
          vowelFound = true
        else
          first.push(letter)
        end
      end
      final.push(second.join("") + first.join("") + "ay")
      
    end
 end
 
 return final.join(" ")
end