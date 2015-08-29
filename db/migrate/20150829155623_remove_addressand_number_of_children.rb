class RemoveAddressandNumberOfChildren < ActiveRecord::Migration
  def change
    remove_column :users, :address
    remove_column :users, :number_of_children
  end
end
