Rails.application.routes.draw do
  resources :votes
  devise_for :users
  root 'welcome#index'

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
