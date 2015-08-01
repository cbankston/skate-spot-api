class Api::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    post = Post.new(create_params)
    post.save!

    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.attributes = update_params
    post.save!

    render json: post
  end

  private

  def create_params
    params.require(:post).permit(:title, :lat, :long, :file_path, :url, :skater_id, :up_vote_count, :down_vote_count)
  end

  def update_params
    params.require(:post).permit(:title, :lat, :long, :file_path, :url, :skater_id, :up_vote_count, :down_vote_count)
  end
end