require './board'
require './player'

WIN = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

class Game
  def initialize
    puts 'Starting game!'
    @board = Board.new
    @current_player_indice = 0
  end

  def player_names
    until Player.count == 2
      puts "Player #{Player.count + 1}, enter your name:"
      name = gets.chomp
      if Player.count.zero?
        player1 = Player.new(name, 'X')
      else
        player2 = Player.new(name, 'O')
      end
    end
    [player1, player2]
  end

  def start
    @board.create
    player1, player2 = player_names
    @players = [player1, player2]
  end

  def current_player
    @players[@current_player_indice]
  end

  def next_player
    @current_player_indice = @current_player_indice.zero? ? 1 : 0
  end

  def validate_move?(spot)
    spot.instance_of?(Integer)
  end

  def pick_spot
    loop do
      break if winner?(@board.gets) # || draw?(@board.gets)

      puts "#{current_player.name}, choose one of available spots!"
      @board.show_board
      spot = gets.chomp.to_i - 1
      if validate_move?(@board.gets[spot])
        @board.gets[spot] = current_player.marker
        next_player
      else
        puts 'Invalid spot! Choose another one!'
        pick_spot
      end
    end
    end_game
  end

  def end_game
    if draw?(@board.gets)
      puts 'Draw!'
      @board.show_board
    end
    @board.show_board if winner?(@board.gets)
  end

  def winner?(board)
    WIN.each do |comb|
      case board.values_at(*comb)
      when %w[O O O]
        puts 'Player 1 wins'
        return true
      when %w[X X X]
        puts 'Player 2 wins'
        return true
      end
    end
    nil
  end

  def draw?(board)
    board.each do |spot|
      spot.eql?('O' || 'X')
    end
  end
end
