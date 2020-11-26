# frozen_string_literal: true

class ChangeColumnsOfUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :prefecture_code, :integer
    remove_column :users, :address_city, :string
    remove_column :users, :address_street, :string
    remove_column :users, :address_building, :string
    add_column :users, :address, :string
  end
end
