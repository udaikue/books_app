# frozen_string_literal: true

class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile, :text
  end
end
