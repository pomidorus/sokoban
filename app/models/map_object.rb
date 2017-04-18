class MapObject
  attr_accessor :position

  def draw
    raise NotImplementedError
  end
end
