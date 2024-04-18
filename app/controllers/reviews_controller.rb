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
  binding.pry
  @review = @wine.reviews.build(review_params)
  @review.user = current_user
  if @review.save
    redirect_to @wine, notice: 'レビューが正常に投稿されました。'
  else
    render :new
  end
end

def edit
  @review = Review.find(params[:id])
end

def update
  @review = Review.find(params[:id])
  if @review.update(review_params)
    redirect_to wine_path(@wine), notice: 'レビューが正常に更新されました。'
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
  redirect_to wine_path(@review.wine), notice: 'レビューが削除されました。'
end

private

def review_params
  params.require(:review).permit(
    :wine_date, :wine_bar, :image, :sweetness, :bitterness, :acidity, :alcohol, :content, fragrance_ids: []).merge(user: current_user)
end

def set_wine
  @wine = Wine.find(params[:wine_id])
end



end
