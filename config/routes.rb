Rails.application.routes.draw do

  get 'segments/index'

  root "users#index"
  #get "/home", to: 'home#index'
  #get "/exam_segment/:id", to: 'users#exam_segment'

  resources :exams
  resources :users do
    # get :exam_segment, on: :collection
    collection do
      get :show_question
      get :exam_segment
      post :user_answer
      #get :segment_complete
    end
  end

  resources :segments do
    member do
      get :select_question
    end
  end
  resources :questions


  devise_for :users, path: 'devise'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
