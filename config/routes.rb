Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :pictures, only: [ :index, :show ]
      resources :bitmaps, only: [ :update ]

      resources :adventures
      resources :tile_pictures
      resources :maps, only: [ :show, :update ]
      resources :regions
      resources :rooms
      resources :terrains
      resources :things
      resources :creatures
    end
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
