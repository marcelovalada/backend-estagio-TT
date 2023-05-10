Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :formularies
  resources :users
  resources :visits
end
