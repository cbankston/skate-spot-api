class Api::SpotsController < ApplicationController
  def index
    render json: Spot.all
  end

  def create
    spot = Spot.create!(create_params)

    render json: spot, serializer: SpotSerializer
  end

  private

  def create_params
    params.require(:spot).permit(:lat, :long, :name).tap do |create_params|
      create_params[:skater_id] = current_skater.id
    end
  end
end