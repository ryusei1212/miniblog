Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  root 'users/timelines#index'

  # TODO: 消す
  # namespace :users do
  #   resources :users, only: %i[show edit update] do
  #     resources :posts, only: %i[index show create edit update destroy]
  #   end
  # end

  resources :users, only: %i[index show edit update], module: :users do
    resources :posts, only: %i[index show create edit update destroy] do
      resource :likes, only: %i[create destroy]
    end
    resources :timelines, only: :index
    resource :relationships, only: %i[create destroy]
    get :following, :followers, on: :member
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener_web' if Rails.env.development?
end
