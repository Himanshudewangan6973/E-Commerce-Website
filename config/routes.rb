Rails.application.routes.draw do
  root 'welcome#index'
  get 'search', to: 'welcome#search'
  get 'prod/:id', to: 'welcome#show',as: 'user_prods'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  get 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  get 'contact', to: 'welcome#contact'
  resources :products
  post 'carts' => "carts#create"
  get 'carts' => "carts#index"
  get 'showcart', to: 'carts#index'
  get 'order/:id' => "orders#create"
  get 'order' => "orders#index"
  get 'orders/pay' => "orders#pay"
  get 'orders/payment' => "orders#payment"
  get 'orders/delete/:id' => "orders#delete"
  get 'adminorder' => "adminorders#index"
  get 'adminorder/:id' => "adminorders#paid"
  get 'pastorders' => "orders#pastorders"
  get 'removecart/:id' => "carts#destroy"
  get 'category' => "welcome#category"
  get 'about' => "welcome#about"
  post 'contact' => "contact#create"
end