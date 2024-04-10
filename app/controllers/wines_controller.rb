class WinesController < ApplicationController

def show
  @wine = Wine.find(params[:id])
  @reviews = @wine.reviews
end






end
