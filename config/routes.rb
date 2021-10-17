# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/user', to: 'user_create#create'
    end
  end
end
