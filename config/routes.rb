Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/', controller: :posts, action: :index

  resources :posts
  resources :comments, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
