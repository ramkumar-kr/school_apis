class AddSchooltoReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :school, index: true
  end
end
