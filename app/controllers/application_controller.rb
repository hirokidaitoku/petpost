class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def counts(user)
    @count_mypets = user.mypets.count
    @count_followings = user.followings.count
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
