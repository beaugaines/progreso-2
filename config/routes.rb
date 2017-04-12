Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

  get 'projects/new'

  get 'projects/edit'

  get 'updates/index'

  get 'updates/show'

  get 'updates/new'

  get 'updates/edit'

  get 'welcome/index'
  
  devise_for :users
  root to: 'welcome#index'
end
