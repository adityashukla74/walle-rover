class RoversController < ApplicationController

  def index
  end
  def move
      valid_plateau_coordinates_inputs?(params[:plateau_limit],
      params[:current_position], params[:inputs] )
      @rover = Rover.new(params[:current_position])
      plateau = Plateau.new(params[:plateau_limit])
      rover_movement = RoverMovement.new
      rover_movement.move(@rover, plateau, params[:inputs])
      render :action => :index
  end
  def plateau_area?(plateau_limit)
    !(plateau_limit.blank? or 
      (accessible_plateau_coordinates = plateau_limit.split(' ')).size != 2 or 
      accessible_plateau_coordinates[0].to_i < 0 or 
      accessible_plateau_coordinates[1].to_i < 0)
  end
  def valid_inputs?(input)
    !input.blank?
  end
  def valid_start_position?(start_position)
    start_position.split(SEPARATED_CHAR).size == 3
  end
  def valid_plateau_coordinates_inputs?(plateau_limit, start_position, inputs)
    plateau_area?(plateau_limit) && valid_start_position?(start_position) && valid_inputs?(inputs)
  end

end
