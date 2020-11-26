# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %I[show edit update destroy]

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :zipcode, :address, :profile)
  end
end
