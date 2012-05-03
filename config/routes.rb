BeerRun::Application.routes.draw do
  resources :beers, :only => [:index, :new, :create]
  get '/vote' => 'beers#vote'
  post '/vote' => 'beers#record_vote'

  devise_for :users, path_names: { sign_in: :log_in, sign_out: :log_out }

  get '/users/edit' => 'users/registrations#edit', as: :edit_registration
  put '/users' => 'users/registrations#update', as: :registration

  root :to => 'beers#index'
end
