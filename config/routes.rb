Rails.application.routes.draw do

  get 'segments/index'

  root "home#index"
  get "/home", to: 'home#index'

  resources :exams
  resources :segments
  resources :questions

  devise_for :users, path: 'users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
