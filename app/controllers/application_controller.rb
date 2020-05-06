class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def counts(user)
    @count_mypets = user.mypets.count if user.mypets.present?
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_posts = user.posts.count
    @count_favorites = user.favorites.count
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
