class MapViewer
  def view(map)
    map.positions.each do |row|
      draw = []
      row.each do |position|
        map.objects.each do |object|
          if position == object.position
            draw << object.draw
            break
          end
        end
      end
      puts draw.join
    end
  end
end
