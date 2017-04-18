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

    map.objects.each do |row|
      draw = row.map {|e| e.draw if contain_position?(e.position)}
      puts draw.compact.join if draw.any?
    end
  end

  private

  def contain_position?(position)
    @positions.include?(position)
  end
end
