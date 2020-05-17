class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def counts(user)
    @count_mypets = user.mypets.count if user.mypets.present?
    @count_followings = user.followings.count if user.followings.present?
    @count_followers = user.followers.count if user.followers.present?
    @count_posts = user.posts.count if user.posts.present?
   # @count_favorites = user.favorites.count if user.favorites.present?
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
