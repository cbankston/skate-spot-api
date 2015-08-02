class Api::PostsController < ApplicationController
  def index
    render json: Post.find_by(skater_id: current_skater.id)
  end

  def create
    post = Post.create!(create_params)

    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes!(update_params)

    render json: post
  end

  private

  def create_params
    params.require(:post).permit(:caption, :lat, :long, :file_path, :url, :skater_id, :up_vote_count, :down_vote_count)
  end

  def update_params
    params.require(:post).permit(:caption, :lat, :long, :file_path, :url, :skater_id, :up_vote_count, :down_vote_count)
  end
end