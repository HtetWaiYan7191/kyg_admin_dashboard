Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'contacts/index', as: :contacts
  resources :blogs
  resources :categories
  resources :testimonials
  namespace :api do
    namespace :v1 do
      resources :contacts
    end
  end
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
    get '/home/index', to:'home#index', as: :home_page
  end

  unauthenticated do
    devise_scope :user do
      root to: 'devise/sessions#new'
    end
  end

end
