class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build  
      @posts = current_user.posts.order(id: :desc).page(params[:page]).per(25).search(params[:search])
    end
  end
  
end
