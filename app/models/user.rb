# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[github]

  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  validates :profile, length: { maximum: 500 }

  def self.find_for_github_oauth(auth)
    User.find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      user.username = auth.info.nickname
      user.email = User.create_unique_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # GitHub認証時、適当なメールアドレスを生成
  def self.create_unique_email(auth)
    "#{auth.uid}#{auth.provider}@example.com"
  end

  # 通常ログイン時、uid文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end
end
