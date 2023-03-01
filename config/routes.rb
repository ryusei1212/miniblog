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

  root 'users/timelines#show'

  scope module: 'users' do
    resource :timeline, only: :show
    resources :users, only: %i[index show edit update] do
      get :likes
      resource :relationships, only: %i[create destroy]
      get :following, :followers, on: :member
    end
    resources :posts, except: %i[index new] do
      resources :likes, only: :index
      resource :like, only: %i[create destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener_web' if Rails.env.development?
end
