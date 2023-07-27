Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "budgets#index"
  resources :budgets, only: [:show, :new, :create] do
    resources :records, only: [:new, :create, :edit, :update]
  end
  resources :budgets, only: [:index, :edit, :update, :destroy]
  resources :records, only: [:index, :destroy]

end
