class BeersController < ApplicationController
  def index
    @beers = Beer.all.sort_by { |beer| -beer.points }
  end

  def vote
   @beers = Beer.order(:name)
   @votes = current_user.votes
  end

  def record_vote
    params[:beers] ||= []
    current_user.votes = params[:beers].collect { |id| Beer.find_by_id(id) }.compact

    if current_user.save
      flash[:notice] = 'Votes recorded.'
    else
      flash[:error] = 'You must submit exactly five beers.'
    end

    redirect_to :action => :vote
  end
end
