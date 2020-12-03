require_relative "./cell.rb"
require_relative "./snake.rb"

module SnakeLadders
  class Board
    BOARD_SIZE = 100
    attr_accessor :cells, :snakes

    def get_new_location(current_location, dice_output)
      current_location = -1 unless current_location
      new_location = current_location + dice_output
      new_location <= final_cell_position ? adjusted_location(new_location) : current_location
    end

    def exausted_by?(location)
      location == final_cell_position
    end

    private

    def initialize
      self.cells = []
      self.snakes = []
      snake = Snake.new(13, 6)
      BOARD_SIZE.times { cells << Cell.new() }
      self.snakes.push(snake)
    end

    def final_cell_position
      @final_cell_position ||= BOARD_SIZE - 1
    end

    def adjusted_location(new_location)
      location = new_location
      eligible_snakes = snakes.select { |snake| snake.start_location == new_location }
      snake = !eligible_snakes.empty? && eligible_snakes.first
      location = snake.end_location if snake

      location
    end
  end
end
