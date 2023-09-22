Rails.application.routes.draw do
  get 'homes/about'
  
  resources :users, only: [:show, :edit]
  
  resources :books, only: [:new, :index, :show, :edit]
  
  root to: "homes#top"
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
