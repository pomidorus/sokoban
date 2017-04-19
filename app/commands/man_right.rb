require_relative 'command'

class ManRight < Command
  def initialize(man_position_mover, reader)
    super "Move man right"
    @man_position_mover = man_position_mover
    @reader = reader
  end

  def execute
    @reader.read
    @man_position_mover.move_right(@reader.map)
  end
end
