class WinesController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
    @reviews = @wine.reviews
  end

  def search
    @wines = Wine.all

    if params[:keyword].present?
      @wines = @wines.joins("LEFT JOIN reviews ON reviews.wine_id = wines.id")
                     .where("wines.name LIKE :keyword OR wines.producer LIKE :keyword OR reviews.content LIKE :keyword", keyword: "%#{params[:keyword]}%")
                     .distinct
    else
      @wines = @wines.where(type_id: params[:type_ids]) if params[:type_ids].present?
      @wines = @wines.where(region_id: params[:region_ids]) if params[:region_ids].present?
      @wines = @wines.where(grape_variety_id: params[:grape_variety_ids]) if params[:grape_variety_ids].present?
      @wines = @wines.distinct
    end

    render 'search'
  end
  end