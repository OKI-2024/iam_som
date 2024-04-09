class ReviewsController < ApplicationController

def index
end

def new
  @wine_review_form = WineReviewForm.new
end

def create
  @wine_review_form = WineReviewForm.new(review_params)
  if @wine_review_form.save
    redirect_to root_path
  else
    render :new
  end
end


private

def review_params
    params.require(:wine_review_form).permit(:wine_date, :name, :image, :content, :wine_bar, :type_id, :grape_variety_id, :region_id,
     :producer, :sweetness, :bitterness, :acidity, :alcohol, fragrances: []).merge(user_id: current_user.id)
  

end

end
