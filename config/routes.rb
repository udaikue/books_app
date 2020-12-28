# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'books#index'
  scope '(:locale)' do
    resources :books
    resources :users, except: :create do
      member do
        get :followings, :followers
      end
    end
    resource :user_icons, only: :destroy
    resources :relationships, only: %I[create destroy]
  end
end
