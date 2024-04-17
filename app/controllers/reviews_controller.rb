class ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]  

def index
  @reviews = Review.order(created_at: :desc).limit(3)
end

def new
  @wine = Wine.find(params[:wine_id])
  @wine_review_form = WineReviewForm.new(fragrance_ids: [], wine_id: @wine.id)
end

def create
  @wine = Wine.find(params[:wine_id])
  @review = @wine.reviews.build(review_params.merge(user: current_user))
  if @review.save
    redirect_to @wine
  else
    render :new
  end
end

private

def review_params
  params.require(:wine_review_form).permit(
    :wine_date, :wine_bar, :image, :sweetness, :bitterness, :acidity, :alcohol, :content, fragrance_ids: []
  )
end

end
