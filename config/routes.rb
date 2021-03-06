Rails.application.routes.draw do
  get 'feed', to: 'feed#rss', :format => 'rss'
  get 'about', to: 'welcome#about'

  resources :votes
  devise_for :users
  root 'welcome#index'

  resources :articles do
    resources :comments
    get 'go', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
