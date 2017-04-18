require_relative 'sokoban_requires'

class Sokoban
  def initialize
    man_position_mover = ManPositionMover.new
    map_viewer = MapViewer.new
    man_position_viewer = ManPositionViewer.new
    sokoban_map = SokobanMap.new
    map_parser = MapParser.new
    reader = SokobanReader.new('level.txt', sokoban_map, map_parser)
    view_map_cmd = ViewMap.new(map_viewer, reader)
    show_help_cmd = ShowHelp.new
    man_position_cmd = ViewManPosition.new(man_position_viewer, reader)
    man_up_cmd = ManUp.new(man_position_mover, reader)
    null_cmd = NullCommand.new

    @cmd_executor = CommandsExecutor.new(null_cmd)
    @cmd_executor.add_command SokobanStrings::HELP_CMD, show_help_cmd
    @cmd_executor.add_command SokobanStrings::VIEW_MAP_CMD, view_map_cmd
    @cmd_executor.add_command SokobanStrings::MAN_POSITION_CMD, man_position_cmd
    @cmd_executor.add_command SokobanStrings::MAN_UP_CMD, man_up_cmd

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
