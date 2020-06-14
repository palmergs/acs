Rails.application.routes.draw do
  get 'home/welcome'
  get 'home/about'

  root to: 'home#welcome'
end
