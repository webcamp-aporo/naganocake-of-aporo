Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  scope module: :customers do
    resource :customer, only: [:show, :edit, :update, :destroy]
    get 'exit' => 'customers#exit'
    resources :items
    resources :shipping_addresses, only:[:index, :edit, :update, :destroy]
  end

  namespace :admins do
  	root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :item_genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
