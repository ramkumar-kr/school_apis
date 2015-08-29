class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude , null: false, default: 0, precision: 10
      t.decimal :longitude , null: false, default: 0, precision: 10
    end
  end
end
