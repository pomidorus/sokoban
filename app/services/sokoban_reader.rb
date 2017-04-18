class SokobanReader
  attr_reader :map

  def initialize(file_name, map, map_parser)
    @file_name = file_name
    @map = map
    @map_parser = map_parser
  end

  def read
    f = File.open(@file_name, 'r')

    set_map_size(f.readline.strip.split)

    (1..@map.height).each do |y|
      line = f.readline.chomp
      line.each_char.with_index do |char, x|
        object = @map_parser.parse(char)
        object.position = Position.new(x,y)
        @map.add_object(object)
      end
    end

    f.close
  end

  private

  def set_map_size(array)
    @map.width = array[0].to_i
    @map.height = array[1].to_i
  end
end
