class Category < ActiveRecord::Base
  validates :rating, presence: true, numericality: {greater_than: 0, less_than: 6}
  validates :name, presence: true
  belongs_to :review, class_name: Review

  def review
    Review.find(review_id)
  end
end