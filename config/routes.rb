Rails.application.routes.draw do

  get 'sessions/new'
  root to: 'homes#analysis'

  resources :answers

  resources :replies, only: [:new, :create,:edit, :update, :destroy] 

  resources :groups, only: [:new, :show, :create, :destroy] 

  resources :group_users, only: [:new, :create, :destroy]

  resources :nices, only: [:create, :destroy] 

  resources :users 

  resources :questions do
    member { get :show_image }
    member { get :show_image_2 }
    member { get :show_image_3}
    member { get :show_image_4}
    member { get :show_image_5}
  end
  resources :homes do
    get :analysis, on: :collection 
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/learn',   to: 'learns#index' 
  get    '/test',    to: 'learns#test'
  
end
