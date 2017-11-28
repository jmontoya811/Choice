Rails.application.routes.draw do

  resources :class_rosters
  resources :posts
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  resources :blogs do 
    member do 
      get :toggle_status
    end 
  end

  root to: 'pages#home'
end
