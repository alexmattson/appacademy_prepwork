class ComputerPlayer
  attr_accessor :dictionary, :guessed_letters, :secret_word
  
  def initialize(dictionary = get_dictionary)
    @dictionary = dictionary
    @secret_word = ""
    @guessed_letters = []
  end
  
  #ref
  def pick_secret_word
    word = @dictionary.sample
    @secret_word = word
    word.length
  end
  
  def check_guess(letter, board)
    find_indices(@secret_word, letter)
  end
  
  #player
  def register_secret_length(length)
    @secret_length = length
    @dictionary = @dictionary.select{|x| x.length == length}
  end
  
  def guess(board)
    letter = ""
    loop do 
      letter = get_letter
      break if !@guessed_letters.include?(letter)
    end
    letter
  end
  
  def get_letter
    
    # Change the search algarith used by the computer to find the best letter
    # most_common_in_english - Chooses letters in order of most commonly use 
    #                          letters in the english language.
    # most_common_remaining  - Chooses letters in order of most common letter 
    #                          in the remaining list of of words the computer
    #                          knows.
    # Comment out the one you are not using.
    
    most_common_in_english
    # most_common_remaining
  end
  
  def most_common_remaining
    most_common = Hash.new(0)
    @dictionary.each do |word|
      word.split("").each do |letter|
        most_common[letter] += 1
      end
    end
    sorted = most_common.sort_by{|key, value| value}.reverse
    (0..sorted.length).each do |i|
      letter = sorted[i][0]
      next if @guessed_letters.include?(letter)
      return letter 
    end
  end
  
  def most_common_in_english
    most_common = ['e', 't', 'a', 'i', 'n', 'o', 's', 'h', 'r', 'd', 'l', 'u', 
                   'c', 'm', 'f', 'w', 'y', 'g', 'p', 'b', 'v', 'k', 'q', 'j', 
                   'x', 'z']
    most_common.each do |letter|
      next if @guessed_letters.include?(letter) 
      @dictionary.each do |word|
        return letter if word.include?(letter)
      end
    end
  end
  
  def handle_response(letter, indices)
    if indices != []
      @guessed_letters << letter
      @dictionary = @dictionary.select do |x| 
        find_indices(x, letter) == indices
      end
      return
    end
    @guessed_letters << letter
    @dictionary = @dictionary.select{|x| !(x.split("").include?(letter))}
  end
  
  def candidate_words
    @dictionary
  end
  
  #helper
  def get_dictionary
    File.new("../lib/dictionary.txt").readlines.map { |l| l.chomp }
  end
  
  def find_indices(word, letter)
    indices = []
    (0..word.length - 1).each do |i| 
      indices << i if word[i] == letter
    end
    indices
  end
  
end
