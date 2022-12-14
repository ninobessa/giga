class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :picture, presence: true

  has_one_attached :picture

  def self.search_by(query)
    return User.where("name ilike ?", "%#{query}%").order(name: :asc) if query.present?

    User.all.order(name: :asc)
  end
end
