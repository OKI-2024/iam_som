class WinesController < ApplicationController

def show
  @wine = Wine.find(params[:id])
  @reviews = @wine.reviews
end

def search
  @q = Wine.ransack(params[:q])
  @wine= @q.result
end






end
