# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %I[show edit update destroy]
  before_action :set_user_for_icon_destroy, only: %I[destroy_icon]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show; end

  def edit
    if @user == current_user
      redirect_to edit_user_registration_path(current_user)
    # ユーザーが本人じゃない場合はユーザーページにリダイレクトする
    else
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  # アイコン画像の削除
  def destroy_icon
    @user.icon.purge
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_for_icon_destroy
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:username, :icon, :email, :password, :zipcode, :address, :profile)
  end
end
