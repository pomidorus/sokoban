require_relative 'command'

class ShowHelp < Command
  def initialize
    super "Shows this help message"
  end

  def execute(args)
  end
end
