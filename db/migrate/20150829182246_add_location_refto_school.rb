class AddLocationReftoSchool < ActiveRecord::Migration
  def change
    add_reference :schools, :location, index: true, foreign_key: true
  end
end
