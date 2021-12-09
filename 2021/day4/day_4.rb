require './Board'

class Game

  def initialize(input_path)
    input = read_input(input_path)
    @drawn_numbers = get_drawn_numbers(input)
    @boards = []
    create_boards(input)
  end

  attr_reader :drawn_numbers, :boards

  def run_game
    @drawn_numbers.each do |number|
      @boards.each do |board|
        board.mark_number(number)
        return number * board.sum if board.fulfilled?
      end
    end
    nil
  end

  private

  def read_input(path)
    file = File.open(path)
    input = file.readlines.map(&:chomp)
    file.close
    input
  end

  def get_drawn_numbers(input)
    input[0].split(',').map(&:to_i)
  end

  def create_boards(input)
    next_board = []
    input.each_with_index do |row, i|
      next if i < 2

      if i % 6 == 1
        @boards << Board.new(next_board)
        next_board = []
        next
      end
      next_board << row.split(' ').map(&:to_i)
    end
  end

end

game = Game.new('input.txt')
puts "Task1: #{game.run_game}"

