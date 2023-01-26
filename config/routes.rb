Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'posts#index'
  scope module: :users do
    resources :users, only: %i[show edit]
  end
  resources :posts, only: %w[index create]

  mount LetterOpenerWeb::Engine, at: "/letter_opener_web" if Rails.env.development?
end
