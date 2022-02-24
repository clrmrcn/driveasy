class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :brand, presence: true
  validates :model, presence: true
  validates :address, presence: true
  has_one_attached :photo
  acts_as_favoritable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  MODELS = Car.all.map(&:model).uniq
end
