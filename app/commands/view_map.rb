require_relative 'command'

class ViewMap < Command
  def initialize(map_viewer, reader)
    super "View map of the game"
    @map_viewer = map_viewer
    @reader = reader
  end

  def execute(args)
    @reader.read
    @map_viewer.view(@reader.map)
  end
end
