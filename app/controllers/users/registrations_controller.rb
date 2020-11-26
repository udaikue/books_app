# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # 通常ログインの場合のuid生成
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end

  protected

  # パスワードとパスワード(確認)を入力したときのみパスワードを更新する
  # その他の項目の更新はパスワードを入力しなくても可能
  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      resource.update(params)
    else
      resource.update_without_password(params)
    end
  end

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(_)
    user_path(current_user)
  end
end
