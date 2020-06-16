Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :adventures, except: %i[new edit]
      resources :maps, except: %i[new edit]
      resources :regions, except: %i[new edit]
      resources :rooms, except: %i[new edit]
      resources :creatures, except: %i[new edit]
      resources :things, except: %i[new edit]
    end
  end

  get 'home/welcome'
  get 'home/about'

  root to: 'home#welcome'
end
