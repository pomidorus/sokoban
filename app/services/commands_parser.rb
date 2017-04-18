class CommandsParser
  attr_reader :args

  def initialize cmd
    @args = []
    @cmd = cmd
  end

  def parse
    case @cmd
      when /help/
        SokobanStrings::HELP_CMD
      when /view map/
        SokobanStrings::VIEW_MAP_CMD
      else
        'not found'
    end
  end
end
