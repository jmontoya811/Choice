Rails.application.routes.draw do

  resources :class_rosters do
    member do 
      get :toggle_status
    end 
  end
  resources :posts do 
    member do 
      get :toggle_status
    end 
  end 
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

  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'

  root to: 'pages#home'
end
