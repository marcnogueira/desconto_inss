# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => '/sidekiq'
  resources :proponents do
    collection do
      get 'update_discount'
    end
  end
end
