class ReviewsController < ApplicationController

def index
end

def new
  @review = Review.new
end


end