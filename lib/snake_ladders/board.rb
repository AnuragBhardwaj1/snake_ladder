require_relative "./cell.rb"
require_relative "./snake.rb"

module SnakeLadders
  class Board
    BOARD_SIZE = 100
    attr_accessor :cells, :snakes

    def get_new_location(current_location, dice_output)
      location = current_location + dice_output
      location <= BOARD_SIZE ? adjust_location(location) : current_location
    end

    def exausted_by?(location)
      location == BOARD_SIZE
    end

    private

    def initialize
      self.cells = []
      self.snakes = []
      snake = Snake.new(14, 7)
      BOARD_SIZE.times { |number| cells << Cell.new(number) }
      self.snakes.push(snake)
    end

    def adjust_location(new_location)
      location = new_location
      eligible_snakes = snakes.select { |snake| snake.start_location == new_location }
      snake = !eligible_snakes.empty? && eligible_snakes.first
      location = snake.end_location if snake

      location
    end
  end
end
