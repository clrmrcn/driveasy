class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_booking_path(@car, @booking), notice: "Driveasy has been notified and will answer rapidly to your booking"
    else
      render 'new'
    end
  end

  def show
    @car = Car.find(params[:car_id])
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
