class ManPositionViewer
  def init_positions
    @positions = [
      Position.new(-1, -1),
      Position.new(0, -1),
      Position.new(1, -1),
      Position.new(-1, 0),
      Position.new(0, 0),
      Position.new(1, 0),
      Position.new(-1, 1),
      Position.new(0, 1),
      Position.new(1, 1)
    ]
  end

  def view(map)
    @positions.map! {|p| p.offset(map.man.position)}

    draw = []
    @positions.each do |position|
      map.objects.each do |object|
        if object.position == position
          draw << object.draw
          break
        end
      end
      if draw.count == 3
        puts draw.join
        draw = []
      end
    end
  end
end
