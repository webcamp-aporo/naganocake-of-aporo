Rails.application.routes.draw do
  get 'item_genres/index'
  get 'item_genres/edit'
  devise_for :customers
  devise_for :admins
  namespace :admin do
    resources :item_genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
