class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :model, presence: true
end
