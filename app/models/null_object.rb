require_relative 'map_object'

class NullObject < MapObject
  def draw
    'n'
  end
end
