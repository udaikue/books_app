# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'user_icons/destroy' => 'user_icons#destroy'
  root 'books#index'
  scope '(:locale)' do
    resources :books
    resources :users, except: :create
  end
end
