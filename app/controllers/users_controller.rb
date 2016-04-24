class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      #保存に成功した場合はユーザーページへリダイレクト
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :area, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path unless current_user == @user 
  end
end
