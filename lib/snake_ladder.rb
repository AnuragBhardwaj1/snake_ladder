require_relative "./snake_ladders/game"
class SnakeLadder
  TERMINATION_COMMANDS = [ "q", "quit", "exit", "c"]
  INFO_COMMANDS = ["s"]
  GAMEPLAY_COMMANDS = ["r"]
  SUPPORTED_COMMANDS = TERMINATION_COMMANDS +  INFO_COMMANDS + GAMEPLAY_COMMANDS

  attr_accessor :game

  private
    def initialize
      self.game = SnakeLadders::Game.new
      loop do
        puts "press 'r' to roll dice of 's' for state and q/exit to quit"
        command = gets.chomp

        next if !SUPPORTED_COMMANDS.include?(command)
        return if TERMINATION_COMMANDS.include?(command)
        display_state if INFO_COMMANDS.include?(command)
        game.play(command) if GAMEPLAY_COMMANDS.include?(command) && !game.complete
      end
    end

     def display_state
        puts @game.session.players_info
      end
end