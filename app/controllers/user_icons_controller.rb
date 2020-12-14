# frozen_string_literal: true

class UserIconsController < ApplicationController
  before_action :set_user

  def destroy
    @user.icon.purge
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
