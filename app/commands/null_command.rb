require_relative 'command'

class NullCommand < Command
  def initialize
    super 'Command not found. Type `help` for usage instructions'
  end

  def execute(args)
    puts description
  end
end
