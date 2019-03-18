# frozen_string_literal: true

Rails.application.routes.draw do
  post '/', to: 'tickets#create'

  resources :tickets, only: %i[index show]
end
