class MapParser
  def parse(char)
    case char
      when ' '
        OpenFloor.new
      when '@'
        Man.new
      when 'o'
        Crate.new
      when '#'
        Wall.new
      when '.'
        Storage.new
      # when '*'
      #   puts 'crate & storage'
      # when '+'
      #   puts 'man & storage'
      else
        NullObject.new
    end
  end
end
