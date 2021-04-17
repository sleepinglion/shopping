Rails.application.routes.draw do
  root 'home#index'

  get 'feed', :to => 'home#feed'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :sessions => "users/sessions", :registrations => "users/registrations", :passwords => "users/passwords" }, :path_names => { :sign_up => 'new', :sign_in => 'login', :sign_out => 'logout' }
  as :user do
    get 'new', :to => 'users::Registrations#new'
    get 'edit', :to => 'users::Registrations#edit'
    get 'login', :to => 'users::Sessions#new'
    get 'logout', :to=> 'users::Sessions#destroy'
  end

  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end

  get 'users', :to => 'users#show', as: 'users'

  #faqs
  resources :faqs, only:[:index,:show]
  resources :shopping_carts
  #contacts
  get 'contacts/complete', :to=>'contacts#complete', as: 'complete_contacts'
  resources :contacts, only:[:index,:create]

  #intro
  get 'intro', :to=>'intro#index', as: 'intro'
  get 'location', :to=>'location#index', as: 'location'
  get 'info', :to=>'info#index', as: 'info'

  resources :accounts
  resources :accounts_products
  resources :accounts_product_categories
  resources :product_categories
  resources :products
  resources :orders
  resources :boards
  resources :notices



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # 관리자
  scope 'admin', module: 'admin', as: 'admin' do
    get '/' => 'admin_home#index'

    resources :intro
    resources :location
    resources :faq_categories
    resources :faqs
    resources :orders
    resources :accounts
    resources :contacts
    resources :notices
    resources :boards
    resources :users
    resources :operators
    resources :sliders
    resources :product_categories
    resources :products do
      resources :product_pictures, except:[:new, :index]
    end
  end
end
