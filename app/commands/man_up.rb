require_relative 'command'

class ManUp < Command
  def initialize(man_position_mover, reader)
    super "Move man up"
    @man_position_mover = man_position_mover
    @reader = reader
  end

  def execute
    @reader.read
    @man_position_mover.move_up(@reader.map)
  end
end
