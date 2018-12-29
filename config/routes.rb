Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  get 'home/index'
  root 'home#index'

  resources :lists do
    resources :items
  end

  # resources :lists
  # resources :items, except: [:new, :create]
  # resources :list, path: '/', only: [] do
  #   resources :items, module: :list, only: [:new, :index, :create]
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
