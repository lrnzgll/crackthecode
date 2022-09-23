# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#welcome'

  resources :games
end
