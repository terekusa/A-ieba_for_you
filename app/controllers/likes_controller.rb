class LikesController < ApplicationController
  before_action :set_post

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_back fallback_location: root_path
  end

  def destroy
    post = current_user.likes.find(params[:id]).post
    current_user.unlike(post)
    redirect_back fallback_location: root_path
  end

  private
end
