class WinesController < ApplicationController

def show
  @wine = Wine.find(params[:id])
  @reviews = @wine.reviews
end

def search
  keyword = params[:keyword]

  @wines = Wine.joins(:reviews)
               .where("wines.name LIKE :keyword OR wines.producer LIKE :keyword OR reviews.content LIKE :keyword", keyword: "%#{keyword}%")
               .distinct

  if params[:types].present?
    @wines = @wines.where(type_id: params[:types])
  end

  if params[:regions].present?
    @wines = @wines.where(region_id: params[:regions])
  end

  if params[:grape_varieties].present?
    @wines = @wines.where(grape_variety_id: params[:grape_varieties])
  end
end




end
