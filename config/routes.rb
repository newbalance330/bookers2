Rails.application.routes.draw do

 devise_for :users
 root to: 'homes#top'
 # as: '名前' は「名前付きルート」といい、コード内でURLをわかりやすく書くために使われます
 # （asは、英語で「～として」の意味）
 get 'home/about', to: 'homes#about', as: 'about'
 resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 resources :users, only: [:new, :create, :index, :show, :edit, :update]

end