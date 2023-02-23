Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :projects do
    resources :bugs
    resources :users do
      get :add_user, :remove_user
    end
  end

  root to: 'projects#index'
end
