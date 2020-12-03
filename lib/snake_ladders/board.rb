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
      self.cells, self.snakes = [], []
      BOARD_SIZE.times { cells << Cell.new() }
      self.snakes << Snake.new(13, 6)
    end

    def final_cell_position
      @final_cell_position ||= BOARD_SIZE - 1
    end

    def adjusted_location(new_location)
      location = new_location
      snake = snakes.select { |snake| snake.start_location == new_location }.first
      location = snake.end_location if snake

      location
    end
  end
end
