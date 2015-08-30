class School < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_one :location
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A.+@.+\z/, message: "Invalid Email ID"}
  validates :phone, presence: true, length: {is: 10}
  validates :address, presence: true, length: {minimum: 5, maximum: 255}
  validates :website, presence: true

  def location
    Location.find(location_id)
  end

  def rating
    sum = 0
    reviews = Review.where(school_id: id)
    reviews.each do |review|
      sum = sum + review.rating
    end
    sum == 0 ? sum : (sum / reviews.count)
  end

  def infra_rating
    sum = 0
    reviews = Review.where(school_id: id)
    reviews.each do |review|
      sum = sum + review.infra_rating
    end
    sum == 0 ? sum : (sum / reviews.count)
  end

  def teaching_rating
    sum = 0
    reviews = Review.where(school_id: id)
    reviews.each do |review|
      sum = sum + review.teaching_rating
    end
    sum == 0 ? sum : (sum / reviews.count)
  end

  def review_json
    data = []
    reviews.each do |r|
      hash = {}
      hash = r.attributes
      hash[:user_name] = r.user_name
      data << hash
    end
    data
  end
end
