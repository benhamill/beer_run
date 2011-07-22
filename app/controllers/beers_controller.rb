class BeersController < ApplicationController
  def index
    @beers = Beer.all.sort_by { |beer| -beer.points }
  end

  def vote
   @beers = Beer.order(:name)
  end
end
