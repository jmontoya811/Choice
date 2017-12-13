Rails.application.routes.draw do

  resources :class_rosters do
    member do 
      get :toggle_status
    end 
  end

  resources :posts do 
    member do 
      get :toggle_status
      get :toggle_timeslot
    end 
  end 
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
resources 'users' do
  resources 'posts'
end 

  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  get 'schedule', to: 'pages#schedule'
  get 'payments', to: 'pages#payments'

  resources :blogs do 
    member do 
      get :toggle_status
    end 
  end

  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'

  resources :deposit, only: [:new, :create]
  get 'thank_you', to: 'deposit#thank_you', as: 'thank_you'
  root to: 'pages#home'
end
