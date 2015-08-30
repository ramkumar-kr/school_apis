class RemoveCategoryfromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :category
  end
end
