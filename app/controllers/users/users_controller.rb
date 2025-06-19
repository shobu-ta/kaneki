class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update!(user_params)
      redirect_to edit_users_mypage_path, notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path, notice: "退会しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :username, :avatar)
  end
end
