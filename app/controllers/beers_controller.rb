class BeersController < ApplicationController
  def index
    @beers = Beer.all.sort_by { |beer| -beer.points }
  end
end
