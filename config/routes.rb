# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => '/sidekiq'
end
