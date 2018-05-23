Rails.application.routes.draw do
  
  get 'admin', to: 'admin#index'

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
      get  'tirerotation'
    end
  end
  resources :truckrelationships,  only: [:create, :destroy]
  resources :truckhistories,      only: [:create, :index, :destroy]

  resources :tirehistories

  resources :partscosts
  resources :laborcosts
  
  get 'kartes/:id' => 'vehicle_kartes#karte', as: :karte
  
  post 'branches/update_branch_usermenus' => 'branches#update_branch_usermenus', as: :branch_usermenus
  post 'branches/update_branch_truckmenus' => 'branches#update_branch_truckmenus', as: :branch_truckmenus
 
  post 'dealerbranches/update_branch_usermenus' => 'dealerbranches#update_branch_usermenus', as: :dealerbranch_usermenus

  post 'trucks/params_copy' => "trucks#params_copy"
  
  resources :oilprices
  resources :loginotes
  
  resources :dealercompanies
  resources :dealerbranches
  resources :dealerusers
  
end
  