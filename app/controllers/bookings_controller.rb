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
    @car = Car.find(params[:car_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @car = Car.find(params[:car_id])
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to profile_path, notice: "Your booking for #{@booking.car.model} has been deleted."
    else
      render 'pages/profile'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
