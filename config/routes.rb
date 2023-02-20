Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
  # post "users/sign_up" => "devise/registrations#new"

  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
