class Api::SkaterProfilesController < ApplicationController
  def show
    profile = SkaterProfile.find_by(skater_id: current_skater.id)

    render json: profile
  end

  def create
    profile = SkaterProfile.new(create_params)
    profile.save!

    render json: profile
  end

  def update
    profile = SkaterProfile.find_by(skater_id: current_skater.id)
    profile.attributes = update_params
    profile.save!

    render json: profile
  end

  private

  def create_params
    params.require(:profile).permit(:skater_id, :first_name, :last_name, :avatar_file_path)
  end

  def update_params
    params.require(:profile).permit(:skater_id, :first_name, :last_name, :avatar_file_path)
  end
end