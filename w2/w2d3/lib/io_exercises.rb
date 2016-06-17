# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

# Game 

def guessing_game
  anwser = (1..100).to_a.sample
  count = 0
  
  loop do
    count += 1
    puts "\"guess a number from 1 to 100\"\n"
    guess = gets.chomp.to_i
    
    puts guess
    break if guess == anwser
    
    puts guess > anwser ? "too high" : "too low"
  end
  
  puts count
end

#Program

lines = File.readlines(ARGV[0]).shuffle
input_name = ARGV[0].split(".")[0]

File.open("#{input_name}-shuffled.txt", "w") do |f|
  (0..lines.length - 1).each {|i|f.puts lines[i]}
end

