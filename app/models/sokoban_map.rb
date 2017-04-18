class SokobanMap
  attr_accessor :width, :height, :crates, :walls, :man, :storages, :objects

  def initialize
    @width = 0
    @height = 0

    @objects = []

    @walls = []
    @crates = []
    @storages = []
    @man = nil
  end
end
