Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  resources :answers
  resources :questions
  resources :formularies
  resources :users
  resources :visits
end
