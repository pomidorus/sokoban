require_relative 'command'

class ViewMap < Command
  def initialize(map_viewer)
    super "View map of the game"
    @map_viewer = map_viewer
  end

  def execute(args)
    @map_viewer.view
  end
end
