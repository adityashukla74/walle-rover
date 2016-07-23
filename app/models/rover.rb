class Rover

  attr_accessor :position_x, :position_y, :direction

  def initialize(start_position)
    position_splitted = start_position.split(SEPARATED_CHAR)
    self.position_x = position_splitted[0].to_i
    self.position_y = position_splitted[1].to_i
    self.direction = position_splitted[2]
  end

  def show_coordinates
    "#{position_x} #{position_y} #{direction}"
  end


end
