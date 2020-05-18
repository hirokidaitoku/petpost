class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to root_url
    else
      @posts = Post.order(id: :desc).page(params[:page])
      flash.now[:danger] = "投稿できませんでした。"
      render "toppages/index"
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:danger] = "投稿を削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  def liked_users
    @post = Post.find(params[:id])
    @liked_users = @post.liked_users.page(params[:page])
    counts(@post)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :image)
  end
end
