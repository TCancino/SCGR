Rails.application.routes.draw do
  #get 'users/index'
  #delete "/posts/delete/:id", to: "posts#destroy", as: "delete_post"
  get "postulation/show_files/:id", to: "postulations#show_user_docs", as: "show_docs_postulation"
  match '/users',   to: 'users#index',   via: 'get'
  resources :document_postulations
  resources :posts
  resources :postulations
  resources :documents
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, :only =>[:update]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
