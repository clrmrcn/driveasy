class CarsController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped

  def index
    if params[:commit].present?
      @cars = Car.where("model ILIKE ?", "%#{params[:model]}%")
    else
      @cars = Car.all
    end
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window: render_to_string(partial: "info_window", locals: { car: car })
      }
    end
  end

  def show
    @car = Car.find(params[:id])
    @review = Review.new
    @reviews = Review.where(car: @car)
  end

  def toggle_favorite
    @car = Car.find(params[:id])
    current_user.favorited?(@car) ? current_user.unfavorite(@car) : current_user.favorite(@car)
  end
end
