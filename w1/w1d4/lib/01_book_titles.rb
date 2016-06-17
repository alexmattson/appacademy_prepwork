class Book
  attr_accessor :title
  
  def title
    @title.titleize 
  end
  
end

class String
  
  def titleize
    littleWords = ["the", "and", "over", "at", "of", "a", 'in', 'an']
    arr = self.split(" ")
    arr.each do |word| 
      unless littleWords.include?(word) && arr.index(word) != 0
        word.capitalize!
      end
    end
    return arr.join(" ")
  end
  
end