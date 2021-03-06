Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items do
    resources :orders, only:[:index, :create] 
  end

  resources :purchases, only: :order do
    post 'order', on: :member
  end
end
