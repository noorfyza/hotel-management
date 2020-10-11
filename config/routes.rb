Rails.application.routes.draw do
  resources :checkins
  resources :rooms
  resources :customers
  get "/available_rooms" => "rooms#available_rooms"
  get "/get_price" => "rooms#get_price"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
