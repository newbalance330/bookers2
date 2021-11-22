Rails.application.routes.draw do

 devise_for :users
 root to: 'homes#top'
 get 'about' => 'homes#about'
 resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 resources :users, only: [:new, :create, :index, :show, :edit, :update]

end