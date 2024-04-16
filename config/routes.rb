Rails.application.routes.draw do
  resources :blogs
  resources :categories
  resources :testimonials
  namespace :api do
    namespace :v1 do
      resources :contacts
    end
  end
  root to: 'home#index'
  get '/home/index', to:'home#index'
  devise_for :users

end
