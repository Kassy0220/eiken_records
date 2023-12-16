# frozen_string_literal: true

Rails.application.routes.draw do
  root 'records#index'
  resources :records
end
