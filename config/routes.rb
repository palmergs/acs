Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :pictures, only: [ :index, :show ]
      resources :bitmaps, only: [ :update ]

      resources :adventures
    end
  end

  mount_ember_app :frontend, to: "/"

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
