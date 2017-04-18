require_relative 'command'

class ShowHelp < Command
  attr_accessor :cmds

  def initialize
    super "Shows this help message"
    @cmds = {}
  end

  def execute(args)
    @cmds.each do |k, v|
      puts "`#{k}` - #{v.description}"
    end
  end
end
