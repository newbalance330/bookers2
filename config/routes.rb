Rails.application.routes.draw do
 devise_for :users
 get "/top" => "homes#top"
# resources :homes
# root 'homes#top'
end
