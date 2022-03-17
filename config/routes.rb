Rails.application.routes.draw do
  devise_for :users
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root "public_recipes#index"

  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
  

  # resources :foods, only: [:index, :create, :new, :destroy]

  resources :recipes, only: [:index]
  resources :users do 
    resources :recipes, except: [:update, :edit] do
      resources :recipe_foods, only: [:new]
      resources :foods, only: [:index] do
        resources :recipe_foods, only: [ :create]
      end
    end
    resources :foods, only: [:index, :create, :new, :destroy]
    # resources :foods, only: [:destroy]
  end


end
