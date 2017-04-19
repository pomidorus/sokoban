class MapObject
  attr_accessor :position

  def draw
    raise NotImplementedError
  end

  def hash
    @position.hash
  end

  def eql?(other)
    @position == other.position
  end

  def ==(other)
    @position == other.position
  end
end
