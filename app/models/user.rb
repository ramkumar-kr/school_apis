class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :encrypted_password, presence: true
  validates :email, presence: true, format: {with: /\A.+@.+\z/, message: "Invalid Email ID"}
  validates :phone, presence: true, length: {is: 10}
end
