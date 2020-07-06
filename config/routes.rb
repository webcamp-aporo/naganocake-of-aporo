Rails.application.routes.draw do

  root 'customers/homes#top'
  get 'orders/new', to: 'customers/orders#new'
  get 'orders/new/confirm', to: 'customers/orders#confirm_new'
  post 'orders/new/confirm', to: 'customers/orders#create'
  get 'orders/finish', to: 'customers/orders#finish'

  devise_for :customers
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  scope module: :customers do
    resource :customer, only: [:show, :edit, :update, :destroy]
    get 'exit' => 'customers#exit'
    resources :items
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
    get "genres" => "items#genres", as: 'genres'            #一時的に追加。最終的にはAjaxにしたい。
  end
  
  delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
  resources :cart_items, only:[:index, :create, :update, :destroy]

  namespace :admins do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :item_genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
