Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  root 'users/timelines#index'

  scope module: 'users' do
    resources :timelines, only: :index
    resources :users, only: %i[index show edit update] do
      member do
        get :following
        get :followers
      end
      resource :relationship, only: %i[create destroy]
    end
    resources :posts, except: %i[index new] do
      resources :comments, module: :posts, only: %i[create update destroy], shallow: true
      resources :liked_users, only: :index
      resource :like, only: %i[create destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener_web' if Rails.env.development?
end
