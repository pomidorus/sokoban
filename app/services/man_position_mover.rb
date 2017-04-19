class ManPositionMover
  def move_up(map)
    move_up_position = Position.new(0, -1)
    open_floor = OpenFloor.new
    open_floor.position = map.man.position
    map.man.position = move_up_position.offset(map.man.position)

    overlap = map.objects & [map.man]
    if overlap.any?
      case overlap.first
        when OpenFloor
          map.update_man_position(overlap.first, open_floor)
          map.save
          puts 'Man moved up'
        else

      end
    else

    end
  end
end
