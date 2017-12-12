Rails.application.routes.draw do

  get 'segments/index'

  root "users#index"
  get "/home", to: 'home#index'
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
   # get 'users/segment_complete/:exam_id', to: "users#segment_complete", as: "users_segment_complete"

  # get 'users/show_question/:segment_id', to: "users#show_question", as: "users_show_question"
  # post 'users/:user_id/user_answer/:question_id', to: "users#user_answer", as: "user_answer"
  resources :segments
  resources :questions


  devise_for :users, path: 'devise'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
