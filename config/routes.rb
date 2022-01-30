Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  root to: "homes#top"
  get '/about', to: "homes#top"
  resources :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
