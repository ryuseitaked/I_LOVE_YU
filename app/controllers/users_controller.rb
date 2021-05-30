class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to articles_path, alert: '不正なアクセスです'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "登録情報を変更しました"
    redirect_to user_path(@user)
  end

  def out
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to articles_path, alert: '不正なアクセスです'
    end
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  def favorites
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
