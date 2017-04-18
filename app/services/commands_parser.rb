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
      else
        SokobanStrings::NOT_FOUND_MSG
    end
  end
end
