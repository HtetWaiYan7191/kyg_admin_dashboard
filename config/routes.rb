Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :new, :edit, :update, :destroy] do
    collection do
      post '/create', to: 'users#create'
    end
  end
  # resources :users, only: [:index, :show]
  get 'contacts/index', as: :contacts
  get 'contacts/:id', to: 'contacts#show', as: :contact

  resources :blogs do 
    collection do 
      get '/filter_by_date', to: "blogs#filter_by_date"
    end
  end

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
