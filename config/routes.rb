# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)" do
    resources :books
  end
end
