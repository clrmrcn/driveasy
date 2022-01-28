class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :model, presence: true
  has_one_attached :photo
  acts_as_favoritable
  MODELS = Car.all.map(&:model).uniq
end
