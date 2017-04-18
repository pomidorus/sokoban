require_relative 'command'

class ShowHelp < Command
  attr_accessor :cmds

  def initialize
    super SokobanStrings::HELP_DESCRIPTION
    @cmds = {}
  end

  def execute
    @cmds.each do |k, v|
      puts "`#{k}` - #{v.description}"
    end
  end
end
