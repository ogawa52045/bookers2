Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update ]
  patch 'books/:id' => 'books#update', as: 'update_book'
  resources :users, only: [:show, :edit, :update, :index]
end
