require_relative "./cell.rb"

module SnakeLadders
  class Board
    BOARD_SIZE = 100
    attr_accessor :cells


    def get_new_location(current_location, dice_output)
      current_location = -1 unless current_location
      new_location = current_location + dice_output

      new_location <= final_cell_position ? new_location : current_location
    end


    def exausted_by?(location)
      location == final_cell_position
    end

    private

    def initialize
      self.cells = []
      BOARD_SIZE.times { cells << Cell.new() }
    end

    def final_cell_position
      @final_cell_position ||= BOARD_SIZE - 1
    end
  end
end