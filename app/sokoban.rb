require_relative 'sokoban_requires'

class Sokoban
  def initialize
    sokoban_map = SokobanMap.new

    man_position_mover = ManPositionMover.new
    man_position_viewer = ManPositionViewer.new
    map_viewer = MapViewer.new
    map_parser = MapParser.new
    map_reader = SokobanReader.new(sokoban_map, map_parser)

    show_help_cmd = ShowHelp.new
    view_map_cmd = ViewMap.new(map_viewer, map_reader)
    man_position_cmd = ViewManPosition.new(man_position_viewer, map_reader)
    man_up_cmd = ManUp.new(man_position_mover, map_reader)
    man_down_cmd = ManDown.new(man_position_mover, map_reader)
    man_left_cmd = ManLeft.new(man_position_mover, map_reader)
    man_right_cmd = ManRight.new(man_position_mover, map_reader)

    null_cmd = NullCommand.new

    @cmd_executor = CommandsExecutor.new(null_cmd)
    @cmd_executor.add_command SokobanStrings::HELP_CMD, show_help_cmd
    @cmd_executor.add_command SokobanStrings::VIEW_MAP_CMD, view_map_cmd
    @cmd_executor.add_command SokobanStrings::MAN_POSITION_CMD, man_position_cmd
    @cmd_executor.add_command SokobanStrings::MAN_UP_CMD, man_up_cmd
    @cmd_executor.add_command SokobanStrings::MAN_DOWN_CMD, man_down_cmd
    @cmd_executor.add_command SokobanStrings::MAN_LEFT_CMD, man_left_cmd
    @cmd_executor.add_command SokobanStrings::MAN_RIGHT_CMD, man_right_cmd

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
