class Api::PostsController < ApplicationController
  def index
    render json: Post.find_by(skater_id: current_skater.id), each_serializer: PostSerializer
  end

  def create
    post = Post.create!(create_params)

    render json: post, serializer: PostSerializer
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes!(update_params)

    render json: post, serializer: PostSerializer
  end

  private

  def create_params
    params.require(:post).permit(:caption, :lat, :long, :file_path, :url, :spot_id).tap do |create_params|
      create_params[:skater_id] = current_skater.id
    end
  end

  def update_params
    params.require(:post).permit(:caption, :file_path)
  end
end