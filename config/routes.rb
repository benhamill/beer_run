BeerRun::Application.routes.draw do
  resources :beers, :only => [:index]
  get '/vote' => 'beers#vote'
  post '/vote' => 'beers#record_vote'

  devise_for :users

  root :to => 'beers#index'
end
