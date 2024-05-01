Rails.application.routes.draw do
  resources :users
  get 'contacts/index'
  resources :blogs
  resources :categories
  resources :testimonials
  resources :contacts 
  namespace :api do
    namespace :v1 do
      resources :contacts
    end
  end
  root to: 'home#index'
  get '/home/index', to:'home#index', as: :home_page
  devise_for :users

end
