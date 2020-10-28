class AddZipcodeAndAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :zipcode, :integer
    add_column :users, :prefecture_code, :integer
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
    add_column :users, :address_building, :string
  end
end
