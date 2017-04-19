require_relative 'command'

class ManDown < Command
  def initialize(man_position_mover, reader)
    super "Move man down"
    @man_position_mover = man_position_mover
    @reader = reader
  end

  def execute
    @reader.read
    @man_position_mover.move_down(@reader.map)
  end
end
