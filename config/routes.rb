Rails.application.routes.draw do

  root to: 'homes#analysis'

  resources :homes do
    get :analysis, on: :collection 
  end
  
end
