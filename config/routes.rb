Rails.application.routes.draw do
  get '/amusement_parks/:amusement_park_id', to: 'amusement_parks#show'

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'

  post '/mechanics/:mechanic_id/rides', to: 'ride_mechanics#create'
end
