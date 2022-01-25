class Review < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :user_id, :uniqueness => { :scope => :car_id,
  :message => "You've already reviewed this car." }
end
