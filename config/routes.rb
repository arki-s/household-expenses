Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "budgets#index"
  resources :budgets, only: [:index, :show, :new, :create] do
    resources :records, only: [:new, :create]
  end
  resources :budgets, only: [:edit, :update, :destroy]
  resources :records, only: [:index, :edit, :update, :destroy]
  get 'calendar', to: 'records#calendar', as: 'calendar'
  get 'list', to: 'budgets#list', as: 'list'
end
