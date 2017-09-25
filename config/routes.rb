Rails.application.routes.draw do
  
  get 'admin', to: 'admin#index'
 
  post 'companies', to:'companies#create'

  get 'new/trackhistories'
  
  get 'vehicle_kartes/home'
  get 'vehicle_kartes', to: 'vehicle_kartes#home'
  get 'vehicle_kartes/show'
  
  get  'vehicle_kartes/:id/order',  to: 'vehicle_kartes#order', as: 'karte_pdf'
  
  get 'static_pages/home'
  
  root to: 'static_pages#home'
  get     'list',   to: 'static_pages#list'
  get     'signup', to: 'users#new'
  get     'login' , to: 'sessions#new'
  post    'login' , to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  resources :users do
    member do
      get 'dashboard'
      get 'list'
    end
  end
  resources :companies
  resources :branches
  resources :trucks do
    member do
      get 'record'
      get 'initset'
      post 'recordinit'
    end
  end
  resources :truckrelationships,  only: [:create, :destroy]
  resources :truckhistories,      only: [:create, :index, :destroy]

  resources :partscosts
  resources :laborcosts
  
  get 'kartes/:id' => 'vehicle_kartes#karte', as: :karte
  
  post 'branches/update_branch_menus' => 'branches#update_branch_menus', as: :branch_menus
  
  resources :oilprices
  resources :loginotes
end
  