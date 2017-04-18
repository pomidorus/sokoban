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

      objects = []
      line.each_char.with_index do |char, x|
        object = @map_parser.parse(char)
        object.position = Position.new( (x + 1), y)
        objects << object

        add_map_object(object)
      end

      @map.objects << objects
    end

    f.close
  end

  private

  def add_map_object(map_object)
    case map_object
      when Crate
        @map.crates << map_object
      when Man
        @map.man = map_object
      when Storage
        @map.storages << map_object
      when Wall
        @map.walls << map_object
      else
        nil
    end
  end

  def set_map_size(array)
    @map.width = array[0].to_i
    @map.height = array[1].to_i
  end
end
