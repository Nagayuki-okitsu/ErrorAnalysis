Rails.application.routes.draw do

  get 'sessions/new'
  root to: 'homes#analysis'

  resources :answers

  resources :replies, only: [:new, :create,:edit, :update, :destroy] 

  resources :users 

  resources :questions do
    member { get :show_image }
  end
  resources :homes do
    get :analysis, on: :collection 
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
