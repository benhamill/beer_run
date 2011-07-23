class BeersController < ApplicationController
  def index
    @beers = Beer.all.sort_by { |beer| -beer.points }
  end

  def vote
   @beers = Beer.order(:name)
   @votes = current_user.votes
  end

  def record_vote
    params[:votes] ||= []
    current_user.votes = params[:votes].collect { |id| Beer.find_by_id(id) }.compact

    if current_user.save
      flash[:notice] = 'Votes recorded.'
    else
      flash[:error] = 'You must submit exactly five beers.'
    end

    redirect_to vote_path
  end
end
