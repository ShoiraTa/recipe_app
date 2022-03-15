Rails.application.routes.draw do
  devise_for :users
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root "public_recipes#index"

  resources :foods, only: [:index, :create, :new, :destroy]

  resources :recipes, only: [:index]
  resources :users do 
    resources :recipes, except: [:update, :edit]
    resources :foods, only: [:destroy]
  end

  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]

end
