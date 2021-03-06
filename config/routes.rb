Rails.application.routes.draw do

#  get 'password_resets/new'
#  get 'password_resets/edit'
#  get 'sessions/new'

  root 'static_pages#home'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :organisations
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :team_members do
    collection {post :import}
  end
  resources :signin_sheets
end
