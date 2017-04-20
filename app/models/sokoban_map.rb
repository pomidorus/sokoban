class SokobanMap
  attr_accessor :width, :height, :crates, :walls, :man, :storages, :objects,
                :step, :positions

  def initialize
    @width = 0
    @height = 0
    @step = 0

    init_objects
  end

  def init_objects
    @walls = []
    @crates = []
    @storages = []
    @floors = []
    @man = nil
    @positions = []
  end

  def update_crate_position(crate, old_crate, overlap)
    @objects.delete(overlap)
    @objects.delete(old_crate)

    @objects << crate
  end

  def update_man_position(man, overlap)
    open_floor = OpenFloor.new
    open_floor.position = @man.position

    @objects.delete(overlap) unless overlap.nil?
    @objects.delete(@man)

    @objects << open_floor
    @objects << man
    @step += 1
  end

  def save
    f = File.open("game_stats.txt", 'w')
    f.puts "#{@step}"
    f.close

    f = File.open("level_#{@step}.txt", 'w')
    f.puts "#{@width} #{@height}"

    @positions.each do |row|
      draw = []
      row.each do |position|
        @objects.each do |object|
          if position == object.position
            draw << object.draw
            break
          end
        end
      end
      f.puts draw.join
    end

    f.close
  end

  def init_positions
    (1..@height).each do |y|
      row = []
      (1..@width).each do |x|
        row << Position.new(x, y)
      end
      @positions << row
    end
  end
end
