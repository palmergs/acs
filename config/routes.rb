Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :adventures, except: %i[new edit]
    end
  end

  get 'home/welcome'
  get 'home/about'

  root to: 'home#welcome'
end
