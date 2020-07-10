Rails.application.routes.draw do

  root 'customers/homes#top'
  get 'about', to: 'customers/homes#about'

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
    resources :orders, only: [:index, :new, :show] do
      # 下の二行はURL'orders/new/confirm'でGETとPOSTリクエストを作ってます
      # POSTの方は動作確認なし。POSTは普通に'/orders'でcreateアクション意送ってもいいかも
      get :confirm, action: :confirm_new, on: :new
      post :confirm, action: :create, on: :new
    end
      get 'finish', to: 'orders#finish'

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
    resources :orders, only: [:index, :show] do
      patch 'order', action: :update_order, on: :member
    end
    patch 'orders/:id/make', to: 'order_items#update_make', as: :order_item
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
