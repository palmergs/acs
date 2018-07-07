Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :adventures
      resources :maps
      resources :regions
      resources :rooms
      resources :creatures
      resources :pictures
      resources :terrains
      resources :tile_pictures
      resources :things

    end
  end
end
