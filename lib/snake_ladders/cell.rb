module SnakeLadders
  class Cell
    attr_accessor :number

    private
    def initialize number
      self.number = number
    end
  end
end