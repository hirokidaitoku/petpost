class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = "投稿をお気に入りしました。"
    redirect_to favorites_user_path(current_user)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:danger] = "お気に入りを解除しました。"
    redirect_to favorites_user_path(current_user)
  end
end
