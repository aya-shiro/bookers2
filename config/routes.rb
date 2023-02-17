Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get "homes/about" => "homes#top", as: "about"
  post "users/sign_up" => "devise/registrations#new"

  resources :users, only: [:show, :edit]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
