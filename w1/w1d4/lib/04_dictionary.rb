class Dictionary
  attr_accessor :entries
  
  def initialize
    @entries = {}
  end
  
  def add (word)
    @entries[word_and_def(word)[0]] = word_and_def(word)[1]
  end
  
  def keywords
    @entries.keys.sort
  end
  
  def include?(word)
    @entries.keys.include?(word)
  end
  
  def find(word)
    @entries.select {|key, value| key.include?(word)}
  end
  
  def printable(final = [])
    sorted.each { |word, defin| final.push("[#{word}] \"#{defin}\"") }
    final.join("\n")
  end
  
  def sorted
    @entries.sort_by{|word, defin| word}
  end
  
  def word_and_def(word)
    (word.is_a?(String)) ? [word, nil] : [word.keys[0], word.values[0]]
  end
end