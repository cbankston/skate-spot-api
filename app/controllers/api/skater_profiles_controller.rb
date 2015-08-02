class Api::SkaterProfilesController < ApplicationController
  def show
    profile = find_profile(current_skater.id)

    render json: profile
  end

  def create
    profile = SkaterProfile.create!(create_params)

    render json: profile
  end

  def update
    profile = find_profile(current_skater.id)
    profile.update_attributes!(update_params)

    render json: profile
  end

  private

  def find_profile(current_skater_id)
    SkaterProfile.find_by(skater_id: current_skater_id)
  end

  def create_params
    params.require(:profile).permit(:skater_id, :first_name, :last_name, :avatar_file_path)
  end

  def update_params
    params.require(:profile).permit(:skater_id, :first_name, :last_name, :avatar_file_path)
  end
end