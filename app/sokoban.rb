require_relative 'sokoban_requires'

class Sokoban
  def initialize
    @cmd_executor = CommandsExecutor.new(NullCommand.new)
    @cmd_executor.add_command SokobanStrings::HELP_CMD, ShowHelp.new
  end

  def run
    puts SokobanStrings::INVITATION
    while true
      print '> '
        cmd_parser = CommandsParser.new(get_command)
        @cmd_executor.execute(cmd_parser)
    end
  end

  private

  def get_command
    gets.chomp
  end
end
