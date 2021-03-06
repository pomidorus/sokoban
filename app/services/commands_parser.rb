class CommandsParser
  attr_reader :args

  def initialize cmd
    @args = []
    @cmd = cmd
  end

  def parse
    case @cmd
      when /#{SokobanStrings::HELP_CMD}/
        SokobanStrings::HELP_CMD
      when /#{SokobanStrings::VIEW_MAP_CMD}/
        SokobanStrings::VIEW_MAP_CMD
      when /#{SokobanStrings::MAN_POSITION_CMD}/
        SokobanStrings::MAN_POSITION_CMD
      when /#{SokobanStrings::MAN_UP_CMD}/
        SokobanStrings::MAN_UP_CMD
      when /#{SokobanStrings::MAN_DOWN_CMD}/
        SokobanStrings::MAN_DOWN_CMD
      when /#{SokobanStrings::MAN_LEFT_CMD}/
        SokobanStrings::MAN_LEFT_CMD
      when /#{SokobanStrings::MAN_RIGHT_CMD}/
        SokobanStrings::MAN_RIGHT_CMD
      else
        SokobanStrings::NOT_FOUND_MSG
    end
  end
end
