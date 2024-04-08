class ReviewsController < ApplicationController

def index
end

def new
  @review = Review.new
  @grouped_wine_regions = grouped_wine_regions
end

def create




end



private

def grouped_wine_regions
  wine_regions_hash = {}

  WineRegion.roots.each do |parent_region|
    wine_regions_hash[parent_region.name] = parent_region.descendants.pluck(:name)
  end

  wine_regions_hash
end

def review_params
  params.require(:review).permit(:name,
                               :wine_date,
                               :image,
                               :wine_bar,
                               :type_id,
                               :grape_variety_id,
                               :region_id,
                               :producer,
                               :sweetness,
                               :bitterness,
                               :alcohol,
                               :fragrances,
                               :content).merge(user_id: current_user.id)
end


end
