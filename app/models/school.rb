class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A.+@.+\z/, message: "Invalid Email ID"}
  validates :phone, presence: true, length: {is: 10}
  validates :address, presence: true, length: {minimum: 5, maximum: 255}
  validates :website, presence: true, format: {with: /\Awww.\z/, message: "Invalid Email ID"}
end
