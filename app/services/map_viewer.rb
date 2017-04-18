class MapViewer
  def view(map)
    map.objects.each do |row|
      draw = row.collect {|e| e.draw}
      puts draw.join
    end
  end
end
