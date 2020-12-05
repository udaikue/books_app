# frozen_string_literal: true

class RemoveGithubusernameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :github_username, :string
  end
end
