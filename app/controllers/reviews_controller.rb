class ReviewsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @review = Review.new(review_params)
    @review.workshop = @workshop
    @review.user = current_user
    if @review.save
      flash[:success] = "Your review has been posted"
      redirect_to workshop_path(@workshop)
    else
      flash[:error] = "An error occured, please try again"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
