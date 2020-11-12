class ReviewsController < ApplicationController
  before_action :find_review, only: %i[destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = cocktail
    if @review.save
      redirect_to cocktail_path(cocktail)
    else
      render :new
    end
  end

  def destroy
    cocktail = @review.cocktail
    @review.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:content, :cocktail_id, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
