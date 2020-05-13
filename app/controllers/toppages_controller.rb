class ToppagesController < ApplicationController

  def index
    if logged_in?
      @post = current_user.posts.build  

#binding.pry
#      SELECT created_at
#        cast(case when created_at.value = 0 then NULL
#                  else created_at.value end AS DATE)
#      FROM Post
      
      if params[:search_created_at].present?
        @posts = Post.
          where("COALESCE(content, '') like ?", "%#{params[:search_content].to_s}%").
          where("COALESCE(image, '') like ?", "%#{params[:search_image].to_s}%").
          where("COALESCE(created_at, '') like ?", "%#{params[:search_created_at]}%").
          page(params[:page]).per(25)
      else
        @posts = Post.
          where("COALESCE(content, '') like ?", "%#{params[:search_content].to_s}%").
          where("COALESCE(image, '') like ?", "%#{params[:search_image].to_s}%").
          page(params[:page]).per(25)
      end
      
#      @posts = Post.
#        where("COALESCE(content, '') like ?", "%#{params[:search_content].to_s}%").
#        where("COALESCE(image, '') like ?", "%#{params[:search_image].to_s}%").
#        where("COALESCE(created_at, '') like ?", "%#{params[:search_created_at]}%").
#        page(params[:page]).per(25)
    end
  end
  
end
