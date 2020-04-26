class MypetsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @mypet = current_user.mypets.build
  end

  def create
    @mypet = current_user.mypets.build(mypet_params)
    if @mypet.save
      flash[:success] = 'ペットを登録しました。'
      redirect_to user_path(current_user)
    else
      @mypets = current_user.mypets.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'ペットの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @mypet = current_user.mypets.find_by(id: params[:id])
  end

  def update
    @mypet = current_user.mypets.find_by(id: params[:id])
    if @mypet.update(mypet_params)
      flash[:success] = "編集に成功しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @mypet = current_user.mypets.find_by(id: params[:id])
    @mypet.destroy
    flash[:success] = "削除されました。"
    redirect_to user_path(current_user)
    
  end
  
  private
  
  def mypet_params
    params.require(:mypet).permit(:petname, :description, :age, :petimage)
  end
end
