Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: %w[index create]
end
