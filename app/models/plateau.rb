class Plateau
  attr_accessor :position_x_max, :position_y_max, :position_x_min, :position_y_min

  def initialize(plateau_limit)
    self.position_x_min = 0
    self.position_y_min = 0
    accessible_plateau_coordinates = plateau_limit.split(SEPARATED_CHAR)
    self.position_x_max = accessible_plateau_coordinates[0].to_i
    self.position_y_max = accessible_plateau_coordinates[1].to_i
  end

  def possible_movement?(position_x, position_y)
    (position_x <= position_x_max ) and (position_x >= position_x_min) and (position_y <= position_y_max ) and (position_y >= position_y_min)
  end

end
