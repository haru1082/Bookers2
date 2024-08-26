Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about"
  get "/books/new" => "books#new"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :sign_out, only: [:index, :show, :new, :edit]
 resources :sign_in, only: [:index, :create, :update, :destroy]


end
