Rails.application.routes.draw do
  devise_for :users


  root "pages#home"

  resources :recipes, only: [:index]
  resources :users, only: [:create, :new, :show, :index] do 
    resources :recipes, except: [:update, :edit]
  end

  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]

end
