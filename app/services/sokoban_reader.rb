class SokobanReader
  attr_reader :map

  def initialize(map, map_parser)
    @map = map
    @map_parser = map_parser
  end

  def read
    read_step

    f = File.open("level_#{@map.step}.txt", 'r')

    set_map_size(f.readline.strip.split)

    @map.objects = []
    @map.init_objects

    (1..@map.height).each do |y|
      line = f.readline.chomp
      line.each_char.with_index do |char, x|
        object = @map_parser.parse(char)
        object.position = Position.new( (x + 1), y)
        @map.objects << object

        add_map_object(object)
      end
    end

    @map.init_positions

    f.close
  end

  private

  def read_step
    f = File.open('game_stats.txt', 'r')
    line = f.readline.chomp
    @map.step = line.to_i
    f.close
  end

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
