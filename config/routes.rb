Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:index]
  root 'groups#index'
end
