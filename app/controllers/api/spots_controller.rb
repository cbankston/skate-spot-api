class Api::SpotsController < ApplicationController
  def create
    spot = Spot.create!(create_params)

    render json: spot
  end

  private

  def create_params
    params.require(:spot).permit(:skater_id, :lat, :long, :name)
  end
end