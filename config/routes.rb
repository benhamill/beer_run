BeerRun::Application.routes.draw do
  resources :beers, :only => [:index]
  get '/vote' => 'beers#vote'

  devise_for :users

  root :to => 'beers#index'
end
