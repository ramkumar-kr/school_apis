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
end
