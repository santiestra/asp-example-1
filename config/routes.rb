Rails.application.routes.draw do
  get '/', controller: :posts, action: :index

  resources :users
  resources :posts
  resources :comments, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
