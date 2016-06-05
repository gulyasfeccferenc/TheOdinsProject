# Build a tic-tac-toe game on the command line where two human 
# players can play against each other and the board is displayed in between turns.
# 
# Think about how you would set up the different elements within the game... 
# What should be a class? Instance variable? Method? 
# A few minutes of thought can save you from wasting an hour of coding.
# Build your game, taking care to not share information between classes 
# any more than you have to.
# Post your solution below, then check out the example solution provided.

module TicTacToe

  class Player

    def initialize
    end
  end

  class Cell
    attr_reader :value
    def initialize (value=" ")
      @value = value
    end

    def fill (value)
      @value = value unless value == " "
    end
  end

  class Board
    def initialize
      @cells = Array.new(3) { Array.new(3) {Cell.new} }

    end

    def draw_board
      @cells.each {|x, y, z| print "| ", x.value," | ", y.value," | ",z.value, " |","\n", "-------------", "\n"}
    end

    def win
    end
  end

  class Game
  
    def initialize
      @board = Board.new()
    end
  end
end

c = TicTacToe::Board.new
c.draw_board
