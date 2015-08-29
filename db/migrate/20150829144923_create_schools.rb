class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :website, null: false, default:"www.example.com"
      t.string :address, null: false, default: ""
      t.decimal :phone, null: false, default: 0, precision: 10
    end
  end
end
