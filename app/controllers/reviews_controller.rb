class ReviewsController < ApplicationController

def index
end

def new
  @review = Review.new
  @grouped_wine_regions = grouped_wine_regions
end


private

def grouped_wine_regions
  wine_regions_hash = {}

  WineRegion.roots.each do |parent_region|
    wine_regions_hash[parent_region.name] = parent_region.descendants.pluck(:name)
  end

  wine_regions_hash
end

end
