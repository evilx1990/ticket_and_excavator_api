# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tickets#index'

  namespace :api do
    namespace :v1 do
      resource :ticket, only: :create
    end
  end

  resources :tickets, only: %i[index show]
end
