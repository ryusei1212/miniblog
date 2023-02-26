Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  root 'users/timelines#index'

  resources :users, only: %i[index show edit update], module: :users do
    resources :posts, only: %i[index show create edit update destroy] do
      resource :like, only: %i[create destroy]
    end
    resources :timelines, only: :index
    resource :relationships, only: %i[create destroy]
    get :following, :followers, on: :member
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener_web' if Rails.env.development?
end
