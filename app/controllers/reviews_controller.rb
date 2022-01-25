class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @car = Car.find(params[:car_id])
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      redirect_to car_path(@car), notice: 'you already reviewed this car'
    end
  end

  def edit
    @car = Car.find(params[:car_id])
    @review = Review.find(params[:id])
  end

  def update
    @car = Car.find(params[:car_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to profile_reviews_path
    else
      render 'profile/reviews'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    redirect_to profile_reviews_path if @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
