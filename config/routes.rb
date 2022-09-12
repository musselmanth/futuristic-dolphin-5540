Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'

  post '/mechanics/:mechanic_id/rides', to: 'ride_mechanics#create'
end
