class Api::PostsController < ApplicationController
  before_action :authenticate_skater!

  def index
    render json: Post.find_by(skater_id: current_skater.id)
  end

  def create
    post = Post.new(create_params)
    post.save!

    render json: post
  end

  def update
    post = Post.find_by(skater_id: params[:id])
    post.attributes = update_params
    post.save!

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