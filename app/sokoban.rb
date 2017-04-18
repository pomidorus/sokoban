require_relative 'sokoban_requires'

class Sokoban
  def initialize
    map_viewer = MapViewer.new
    show_help_cmd = ShowHelp.new
    reader = SokobanReader.new('level.txt', SokobanMap.new)

    @cmd_executor = CommandsExecutor.new(NullCommand.new)
    @cmd_executor.add_command SokobanStrings::HELP_CMD, show_help_cmd
    @cmd_executor.add_command SokobanStrings::VIEW_MAP_CMD, ViewMap.new(map_viewer, reader)

    show_help_cmd.cmds = @cmd_executor.commands
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
