Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :pictures, only: [ :index ]
    end
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
