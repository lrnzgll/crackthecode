# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#welcome'

  resources :games, only: [:show, :new, :create] do
    resources :attempts, only: [:create]
  end
end
