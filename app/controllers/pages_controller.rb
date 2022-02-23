class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @bookings = Booking.where(user: current_user)
  end

  def reviews
    @reviews = Review.where(user: current_user)
  end

  def favorites
    @favorites = current_user.all_favorited
  end
end
