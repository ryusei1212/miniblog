Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  # resources :users, only: %i[index show edit update], module: :users do
  #   resources :posts, only: %i[index show create edit update destroy] do
  #     resource :like, only: %i[create destroy]
  #   end
  #   resources :timelines, only: :index
  #   resource :relationships, only: %i[create destroy]
  #   get :following, :followers, on: :member
  # end

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
      resources :likes, only: :index
      resource :like, only: %i[create destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener_web' if Rails.env.development?
end
