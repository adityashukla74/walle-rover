class RoverMovement
  def move(rover, plateau, inputs)
    results = []
    inputs.split('').each do |input|
      input = input.upcase
      if input == "L" or input == "R"
        rover.direction = rotate(rover.direction, input)
      elsif input == "M"
         rover.position_x, rover.position_y = forward(rover.position_x, rover.position_y, rover.direction, plateau)
      end
    end
  end

  def forward(position_x, position_y, direction, plateau)
    position_x_new = position_x
    position_y_new = position_y

    case direction
      when "N" then position_y_new = position_y + 1
      when "S" then position_y_new = position_y - 1
      when "E" then position_x_new = position_x + 1
      when "W" then position_x_new = position_x - 1
    end

    if !plateau.possible_movement?(position_x_new, position_y_new)
      #Robot cant move outside plateu
      Rails.logger.info "Robot can't move outside to #{position_x_new}, #{position_y_new}"
      return position_x, position_y
    else
      return position_x_new, position_y_new
    end
  end

  ROTATE_ROVER = {
                  "N" => "EL",
                  "S" => "ER", 
                  "E" => "NR", 
                  "W" => "NL",
                  "N" => "WR", 
                  "S" => "WL", 
                  "E" => "SL", 
                  "W" => "SR"
                 }
  def rotate(rover_dir, move_dir)
    ROTATE_ROVER["#{rover_dir}#{move_dir}"]
  end
end
