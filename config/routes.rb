# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tickets#index'

  resources :tickets, only: %i[index show create]
end
