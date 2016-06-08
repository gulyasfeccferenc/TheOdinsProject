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
    #@current_word.gsub(/#{letter}/, letter)
    if @current_word.include?letter
      correct_letters << letter 
    else
      incorrect_letters << letter
    end
    @game_word = @current_word.split('').map do |x|
        if correct_letters.include?x
          x = x
        else
          x = '_ '
        end
    end
    @game_word.join()
  end


  def start
    @currentWord = getNewWord
    @correct_letters = []
    @incorrect_letters = []

    while @current_word.length < 4 || @current_word.length > 12
      @current_word = getNewWord
    end
    @game_word = censor(@current_word)
  end

  def game
    start()
    puts @game_word
    puts "Type a letter below:"
    while incorrect_letters.length < 5
      letter = gets.chomp
      puts "You guessed: #{letter}"
      puts guess(letter)
      puts "You already tried #{incorrect_letters}"
    end
    puts "LOOOOOOOSEEEEEER"
  end
end

game = Hangman.new()
game.game