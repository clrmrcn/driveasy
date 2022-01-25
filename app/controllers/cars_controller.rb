class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @review = Review.new
    @reviews = Review.where(car: @car)
  end
end
