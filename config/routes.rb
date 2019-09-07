Rails.application.routes.draw do
  
  get 'logithreads/create'

  get 'logithreads/index'

  get 'logithreads/destroy'

  get 'logiposts/index'

  get  'admin', to: 'admin#new'
  post 'admin', to: 'admin#create'
  get  'adminpanel', to: 'admin#index'
  get  'newadmin', to: "admin#newadmin"
  post 'createadmin', to: "admin#createadmin"
  get  'admin_setuser', to: "admin#setuser"
  
  
  
  
  
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
  
  get     'dlogin', to: 'dsessions#new'
  post    'dlogin', to: 'dsessions#create'
  delete  'dlogout', to: 'dsessions#destroy'
  
  
  resources :dealerusers
  
  resources :users do
    member do
      get 'dashboard'
      get 'list'
      get 'admin_setuser'
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
      get  'adjust'
      post 'adjust'
    end
  end
  resources :truckrelationships,  only: [:create, :destroy]
  resources :truckhistories,      only: [:create, :index, :destroy]


  resources :trailers

  resources :maintains,           only: [:create]

  resources :tirehistories

  resources :partscosts
  resources :laborcosts
  
  get 'kartes/:id'   => 'vehicle_kartes#karte', as: :karte
  get 'bookings/:id' => 'vehicle_kartes#booking', as: :booking
  
  post 'branches/update_branch_usermenus' => 'branches#update_branch_usermenus', as: :branch_usermenus
  post 'branches/update_branch_truckmenus' => 'branches#update_branch_truckmenus', as: :branch_truckmenus
  post 'branches/update_branch_trailermenus' => 'branches#update_branch_trailermenus', as: :branch_trailermenus
 
  post 'dealerbranches/update_branch_usermenus' => 'dealerbranches#update_branch_usermenus', as: :dealerbranch_usermenus

  post 'trucks/params_copy' => "trucks#params_copy"
  
  resources :oilprices
  resources :loginotes
  
  resources :dealercompanies
  resources :dealerbranches
  resources :dealerusers
  resources :approvers
  
  #resources :bookings, only: [:create, :destroy]
  
  get '/sendbookings/:truck_id' => 'sendbookings#create', as: :sendbooking
  
  
  get '/approve' => 'sendbookings#approve', as: :approve
  patch '/approveOK' => 'sendbookings#approveOK', as: :approve_ok
  patch '/approveCancel' => 'sendbookings#approveCancel', as: :approve_cancel
  
  
  get '/access' => 'logithreads#access', as: :access
  get '/confirm/:id' => "logithreads#confirm", as: :confirm
  
  resources :logithreads do
    member do
      resources :logiposts
    end
  end
end
  