Rails.application.routes.draw do
  resources :checkins
  resources :rooms
  resources :customers
  get "/available_rooms" => "rooms#available_rooms"
  get "/checkout" => "checkins#checkout"
  get "/get_price" => "rooms#get_price"
  get "/checkout_complete" => "checkins#checkout_complete"
  get "/welcome" => "customers#welcome"

  
  root to: 'customers#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
