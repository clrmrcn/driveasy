class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :model, presence: true
  acts_as_favoritable
end
