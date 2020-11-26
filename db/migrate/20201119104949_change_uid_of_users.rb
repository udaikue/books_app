# frozen_string_literal: true

class ChangeUidOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :uid, :string, null: false, default: ''
  end
end
