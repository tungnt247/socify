Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :posts, except: %i[new edit] do
    resources :comments, only: %i[create update destroy]
  end
  resources :users, only: %i[index show] do
    resources :relationships, only: %i[create] do
      collection do
        patch :accept
        patch :decline
        delete :unfriend
      end
    end
  end
end
