class ManPositionMover
  def move_right(map)
    @map = map
    move_by(Position.new(1, 0), 'right')
  end

  def move_left(map)
    @map = map
    move_by(Position.new(-1, 0), 'left')
  end

  def move_down(map)
    @map = map
    move_by(Position.new(0, 1), 'down')
  end

  def move_up(map)
    @map = map
    move_by(Position.new(0, -1), 'up')
  end

  private

  def move_by(position, type)
    open_floor = OpenFloor.new
    open_floor.position = @map.man.position
    @map.man.position = position.offset(@map.man.position)

    overlap = @map.objects & [@map.man]
    if overlap.any?
      case overlap.first
        when OpenFloor
          @map.update_man_position(overlap.first, open_floor)
          @map.save
          puts "Man moved #{type}"
        when Wall
          puts 'Can not move - there is a wall'
        else
          puts 'No move case specified'
      end
    else
    end
  end
end
