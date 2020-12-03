module SnakeLadders
  class Snake
    attr_accessor :start_location, :end_location

    private
      def initialize start_location, end_location
        self.start_location = start_location
        self.end_location = end_location
      end
  end
end