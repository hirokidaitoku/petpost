class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(30).search(params[:search])
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @mypets = current_user.mypets.order(id: :desc).page(params[:id])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "会員登録が完了しました。"
      redirect_to @user
    else
      flash.now[:danger] = "会員登録に失敗しました。"
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def posts
    @user = User.find(params[:id])
    @myposts = @user.posts.page(params[:page])
    counts(@user)
  end
    
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorites.page(params[:page])
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
