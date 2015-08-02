class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :zip, :string
  end
end
