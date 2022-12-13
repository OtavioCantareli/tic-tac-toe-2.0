class Board
  def create
    @board = Array.new(9)
    @board.each_index do |ind|
      @board[ind] = ind + 1
    end
  end

  def show_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def initialize
    puts 'Board created!'
  end
end

board = Board.new

board.create
board.show_board
