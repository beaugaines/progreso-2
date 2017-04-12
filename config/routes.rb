Rails.application.routes.draw do
  resources :projects do
    resources :updates
  end

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  devise_for :users
  root to: 'welcome#index'
end
