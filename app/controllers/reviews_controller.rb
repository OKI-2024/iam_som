class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_wine, only: [:new, :create, :edit, :update, :show]

def index
  @reviews = Review.order(created_at: :desc).limit(5)
end

def new
  @review = @wine.reviews.build
end

def create
  @wine = Wine.find(params[:wine_id])
  @review = @wine.reviews.build(review_params.except(:fragrances))
  @review.user = current_user

  # 指定されたfragrance_idsに基づいてFragranceReviewの関連を設定
  selected_fragrances = params[:review][:fragrances][:fragrance_ids].map(&:to_i)
  @review.fragrances = Fragrance.find(selected_fragrances)

  if @review.save
    redirect_to @wine
  else
    render :new
  end
end

def edit
  @review = Review.find(params[:id])
end

def update
  @review = Review.find(params[:id])

  # レビュー情報の更新
  if @review.update(review_params.except(:fragrances))
    # 指定されたfragrance_idsに基づいてFragranceReviewの関連を更新
    selected_fragrances = params[:review][:fragrances][:fragrance_ids].map(&:to_i)
    @review.fragrances = Fragrance.find(selected_fragrances)

    redirect_to wine_path(@wine)
  else
    render :edit
  end
end
def show

  @review = Review.find(params[:id])
end


def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to user_path(current_user)
end

private

def review_params
  params.require(:review).permit(
    :wine_date, :wine_bar, :image, :sweetness, :bitterness, :acidity, :alcohol, :content, fragrances: [fragrance_ids: []]).merge(user: current_user)
end

def set_wine
  @wine = Wine.find(params[:wine_id])
end



end
