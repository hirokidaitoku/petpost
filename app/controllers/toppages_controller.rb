class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build  
      #@posts = current_user.posts.order(id: :desc).page(params[:page]).per(25).search(params[:search])
#binding.pry
#      @posts = Post.
#        where("content IS NULL OR content like ?", "%#{params[:search_content].to_s}%").
#        where("image IS NULL OR image like ?", "%#{params[:search_image].to_s}%").
#        page(params[:page]).per(25)

#binding.pry
#      @posts = Post.
#        where(params[:search_content].present? ? "content like ?" : "content IS NULL", "%#{params[:search_content].to_s}%").
#        where(params[:search_image].present? ? "image like ?" : "image IS NULL", "%#{params[:search_image].to_s}%").
#        page(params[:page]).per(25)

#binding.pry
      @posts = Post.
        where("COALESCE(content, '') like ?", "%#{params[:search_content].to_s}%").
        where("COALESCE(image, '') like ?", "%#{params[:search_image].to_s}%").
#        where("COALESCE(created_at, '') like ?", "%#{params[:search_created_at]}%").
        page(params[:page]).per(25)
    end
#binding.pry
#    @posts = Post.where("created_at like ?", "%#{params[:search_created_at]}%").page(params[:page]).per(25)
  end
  
end
