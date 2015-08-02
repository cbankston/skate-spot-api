class Api::PostVotesController < ApplicationController
  def create
    PostVote.create!(create_params)

    render json: true
  end

  private

  def create_params
    params.require(:vote).permit(:post_id, :direction).tap do |create_params|
      create_params[:skater_id] = current_skater.id
    end
  end
end