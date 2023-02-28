Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  root 'users/timelines#index'

  # resources :users, only: %i[index show edit update], module: :users do
  #   resources :posts, only: %i[index show create edit update destroy] do
  #     resource :like, only: %i[create destroy]
  #   end
  #   resources :timelines, only: :index
  #   resource :relationships, only: %i[create destroy]
  #   get :following, :followers, on: :member
  # end

  scope module: 'users' do
    resources :users, only: %i[index show edit update] do
      resource :relationships, only: %i[create destroy]
      get :following, :followers, on: :member
    end
    resources :posts, except: :new do
      resources :likes, only: :index
      resource :like, only: %i[create destroy]
    end
    resource :timeline, only: :index
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener_web' if Rails.env.development?
end
