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
    man = Man.new
    man.position = position.offset(@map.man.position)

    overlap = @map.objects & [man]
    if overlap.any?
      case overlap.first
        when OpenFloor
          @map.update_man_position(man, overlap.first)
          @map.save
          puts "Man moved #{type}"
        when Crate
          move_crate(man, overlap.first, type)
        when Wall
          puts 'Can not move - there is a wall'
        else
          puts 'No move case specified'
      end
    else
    end
  end

  def move_crate(man, crate, type)
    position = case type
                 when 'left'
                   Position.new(-1, 0)
                 when 'right'
                   Position.new(1, 0)
                 when 'down'
                   Position.new(0, 1)
                 when 'up'
                   Position.new(0, -1)
                 else
                   Position.new(0, 0)
               end

    new_crate = Crate.new
    new_crate.position = position.offset(crate.position)

    overlap = @map.objects & [new_crate]
    if overlap.any?
      case overlap.first
        when OpenFloor
          @map.update_crate_position(new_crate, crate, overlap.first)
          @map.update_man_position(man, nil)
          @map.save
          puts "Man moved #{type} and crate moved #{type}"
        else
          puts 'Can not move - there is a wall or crate'
      end
    end
  end
end
