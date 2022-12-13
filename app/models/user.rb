class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :picture, presence: true

  has_one_attached :picture
end
