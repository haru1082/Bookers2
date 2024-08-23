Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  get "/home/about" => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :sign_out, only: [:home, :about, :sign_up, :log_in]
 resources :sign_in, only: [:home, :users, :books, :log_out]



end
