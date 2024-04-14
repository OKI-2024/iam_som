class WinesController < ApplicationController

def show
  @wine = Wine.find(params[:id])
  @reviews = @wine.reviews
end

def search
  if params[:keyword].present?
    @wines = Wine.joins(:reviews).where("wines.name LIKE :search OR wines.producer LIKE :search OR reviews.content LIKE :search", search: "%#{params[:keyword]}%").distinct
  else
    @wines = Wine.all
    @wines = @wines.where(type_id: params[:type_ids]) if params[:type_ids].present?
    @wines = @wines.where(region_id: params[:region_ids]) if params[:region_ids].present?
    @wines = @wines.where(grape_variety_id: params[:grape_variety_ids]) if params[:grape_variety_ids].present?
    @wines = @wines.distinct
  end

  render 'search'
end

end
