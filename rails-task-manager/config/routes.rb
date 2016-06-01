Rails.application.routes.draw do
    resources :tasks

    post '/tasks', to: 'tasks#index'
  end

