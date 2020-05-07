Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :posts, except: %i[new edit] do
    resources :comments, only: %i[create update destroy]
  end
end
