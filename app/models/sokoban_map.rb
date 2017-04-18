class SokobanMap
  attr_accessor :width, :height
  attr_reader :objects

  def initialize
    @width = 0
    @height = 0

    @objects = []
    @walls = []
    @crates = []
    @storages = []
    @man = nil
  end

  def add_object(object)
    @objects << object
  end
end
