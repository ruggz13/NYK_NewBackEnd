Rails.application.routes.draw do
  # devise_for :users
  resources :plans
  resources :reviews
  resources :restaurants
  resources :users
  devise_for :users, controllers: { sessions: 'user/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
