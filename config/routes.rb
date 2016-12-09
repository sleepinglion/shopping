Rails.application.routes.draw do
  root :to => 'home#index'
  mount Ckeditor::Engine => 'ckeditor'  
  
  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get '/admins', :to => 'admins::Registrations#index'
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end
  
  devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get 'new', :to => 'users::Registrationss#new'
    get 'edit', :to => 'users::Registrationss#edit'
    get 'login', :to => 'users::Sessions#new'
    get 'logout', :to=> 'users::Sessions#destroy'
  end
  
  get '/login', :to =>  'users/sessions#new'
  
  resources :products
  resources :orders
  resources :notices
  resources :faqs
 

    
  # 관리자
  namespace :admin do
    get '/' => 'admin#index'
    resources :gene_categories
    resources :genes
    resources :gene_relations    
    resources :report_categories
    resources :reports
    
    resources :orders
    resources :shippings
    resources :products do
      resources :product_pictures
    end
    resources :payments
    resources :guests
    resources :notices
    resources :faqs
    
    resources :operators
    resources :users
    resources :user_login_logs
    resources :delete_users 
  end
end
