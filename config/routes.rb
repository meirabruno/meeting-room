# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"

  resources :rooms
  resources :room_bookings, only: [:create, :destroy]
end
