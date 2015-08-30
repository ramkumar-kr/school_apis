class AddReviewstoCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :review, index: true
  end
end
