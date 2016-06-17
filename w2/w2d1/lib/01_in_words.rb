class Fixnum
  
  def in_words
    self == 0 ? (return "zero") : final = [] 
    
    i = 12
    j = 14
    chunks_index = 4
    while i > 2
      if self.num_digits > i && self.pull_digits(i, j) > 0
        final.push(thousands_plus(self.pull_digits(i, j), chunks_index))
      end
      i -= 3
      j -= 3
      chunks_index -= 1
    end
    
    final.push(hundreds(self.pull_digits(2, 2))) if self.num_digits > 2 && self.pull_digits(2, 2) > 0
    final.push(tens(self.pull_digits(0, 1))) if self.pull_digits(0, 1) > 0
    
    final.join(" ")
  end
  
  def tens(num)
    letters = []
    if num < 20
      letters.push(words_for(:under_20, num))
    else
      letters.push(words_for(:tens, (num / 10) - 2))
      letters.push(words_for(:under_20, num % 10)) if num % 10 > 0
    end
    letters.join(" ")
  end
    
  def hundreds(num)
    final = []
    final.push(tens(num.pull_digits(0, 2)))
    final.push(words_for(:chunks, 0))
    final.join(" ")
  end
  
  def thousands_plus(num, chunks_index)
    final = []
    final.push(hundreds(num.pull_digits(2, 2))) if num.num_digits > 2
    final.push(tens(num.pull_digits(0, 1)))
    final.push(words_for(:chunks, chunks_index))
    final.join(" ")
  end
  
  def num_digits
    Math.log10(self).to_i + 1
  end
  
  def pull_digits(a, b)
    self.to_s.reverse[a..b].reverse.to_i
  end
  
  private
  
  def words_for(range, index)
    { under_20: ["zero", "one", "two", "three", "four", "five",
                    "six", "seven", "eight", "nine", "ten", "eleven",
                    "twelve", "thirteen", "fourteen", "fifteen", 
                    "sixteen", "seventeen", "eighteen", "nineteen"],
      tens: ["twenty", "thirty", "forty", "fifty", "sixty", "seventy",
            "eighty", "ninety"],
      chunks: ["hundred", "thousand", "million", "billion", "trillion"]
    }[range][index]
  end
  
end