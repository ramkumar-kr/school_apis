class AddLocationReftoSchool < ActiveRecord::Migration
  def change
    add_reference :location, :schools, index: true, foreign_key: true
  end
end
