class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_car, except: :destroy
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_booking_path(@car, @booking), notice: "Driveasy has been notified and will answer rapidly to your booking"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @car = Car.find(params[:car_id])
  end

  def update
    @car = Car.find(params[:car_id])
    if @booking.update(booking_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
    if @booking.destroy
      redirect_to profile_path, notice: "Your booking for #{@booking.car.model} has been deleted."
    else
      render 'pages/profile'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
