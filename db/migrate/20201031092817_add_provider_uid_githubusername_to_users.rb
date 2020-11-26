# frozen_string_literal: true

class AddProviderUidGithubusernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :github_username, :string

    add_index :users, %i[provider uid], unique: true
  end
end
