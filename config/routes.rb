BeerRun::Application.routes.draw do
  resources :beers, :only => [:index]

  devise_for :users

  root :to => 'beers#index'
end
