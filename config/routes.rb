BeerRun::Application.routes.draw do
  resources :beers, :only => [:index, :new, :create]
  get '/vote' => 'beers#vote'
  post '/vote' => 'beers#record_vote'

  devise_for :users, controllers: { passwords: 'users/passwords' }

  root :to => 'beers#index'
end
