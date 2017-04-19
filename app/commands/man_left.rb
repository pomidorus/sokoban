require_relative 'command'

class ManLeft < Command
  def initialize(man_position_mover, reader)
    super "Move man left"
    @man_position_mover = man_position_mover
    @reader = reader
  end

  def execute
    @reader.read
    @man_position_mover.move_left(@reader.map)
  end
end
