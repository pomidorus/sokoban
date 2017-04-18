require_relative 'command'

class ViewManPosition < Command
  def initialize(man_position_viewer, reader)
    super "View man position in the game"
    @man_position_viewer = man_position_viewer
    @reader = reader
  end

  def execute(args)
    @reader.read
    @man_position_viewer.init_positions
    @man_position_viewer.view(@reader.map)
  end
end
