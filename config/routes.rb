Rails.application.routes.draw do
  resources :banners
  resources :brand_partners do 
    resources :items
  end
  resources :brand_categories 
  resources :kings_yangon_users do 
    collection do 
      get 'sign_up', to: "kings_yangon_users#sign_up"
      post 'sign_in', to: "kings_yangon_users#sign_in"
      get 'sign_in_page', to: "kings_yangon_users#sign_in_page"
      delete 'log_out', to: "kings_yangon_users#log_out"
    end
  end

  resources :page, only: [] do 
    collection do 
      get 'landing', to: 'page#landing'
    end
  end


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }
  
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

  authenticated :user, ->(user) {user.management?} do
    root to: 'brand_categories#index', as: :management_root
  end

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  authenticated :kings_yangon_user do 
    root to: 'page#landing', as: :landing_page
  end

  unauthenticated do
    devise_scope :user do
      root to: 'page#welcome'
    end
  end

end
