class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer :number_of_children, null: false, default: 0
      t.string :address, null: false, default: ""
      t.decimal :phone, null: false, default: 0, precision: 10
    end
  end
end
