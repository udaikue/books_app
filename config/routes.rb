# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show' => 'users#show'
  root 'books#index'
  scope '(:locale)' do
    resources :books, :users
  end
end
