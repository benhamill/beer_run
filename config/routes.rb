BeerRun::Application.routes.draw do
  resources :beers, :only => [:index, :new, :create]
  get '/vote' => 'beers#vote'
  post '/vote' => 'beers#record_vote'

  devise_for :users, controllers: { passwords: 'users/passwords' }, path_names: { sign_in: :log_in, sign_out: :log_out }

  root :to => 'beers#index'
end
