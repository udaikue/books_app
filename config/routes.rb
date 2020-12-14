# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'books#index'
  scope '(:locale)' do
    resources :books
    resources :users, except: :create
    resources :user_icons, only: :destroy
  end
end
