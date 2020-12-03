Rails.application.routes.draw do
  #get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :postulations
  resources :document_postulations
  resources :posts
  resources :documents
  #devise_for :users
  devise_for :users
  resources :users, :only =>[:show]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
