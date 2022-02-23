class ReviewsController < ApplicationController
  before_action :set_car, except: :destroy
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      redirect_to car_path(@car), notice: 'you already reviewed this car'
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to profile_reviews_path
    else
      render 'profile/reviews'
    end
  end

  def destroy
    redirect_to profile_reviews_path if @review.destroy
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description)
  end
end
