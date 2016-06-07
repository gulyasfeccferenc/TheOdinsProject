# Simple hangman program where you can challenge a computer in finding out a totally random word

class Hangman
  attr_accessor :correct_letters, :incorrect_letters, :current_word, :game_word

  def getNewWord
    @current_word = ''
    File.open("5desk.txt", "r").readlines.each_with_index { |line, index| @current_word = line if index == rand(10000) }
    @current_word
  end

  def censor word
    back = word.split('').map {|x| x = '_ '}
    back.join()
  end

  def guess (letter)
    regex = ['/',letter,'/'].join
    @game_word = @current_word.gsub(/a/, '_')
  # @game_word = @current_word.split('').each do |x| 
  #   print x
  #   if x == letter
  #     x = letter
  #     @correct_letters << letter
  #   else  
  #     x = '_ '
  #     @incorrect_letters << letter unless @incorrect_letters.include? letter
  #   end
  # end

  
    puts @incorrect_letters
    @game_word
  end

  def start
    @currentWord = getNewWord
    @correct_letters = []
    @incorrect_letters = []

    while @current_word.length < 4 || @current_word.length > 12
      @current_word = getNewWord
    end
    @game_word = @current_word
  end
end



#print censor(currentWord)
game = Hangman.new()
game.start
puts gameWord = game.guess('a')