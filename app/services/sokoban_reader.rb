class SokobanReader
  attr_reader :map

  def initialize(file_name, map)
    @file_name = file_name
    @map = map
  end

  def read
    f = File.open(@file_name, 'r')

    set_map_size(f.readline.strip.split)

    (1..@map.height).each do |_|
      puts f.readline
    end

    f.close
  end

  private

  def set_map_size(array)
    @map.width = array[0].to_i
    @map.height = array[1].to_i
  end
end
