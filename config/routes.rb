Rails.application.routes.draw do
  resources :questions
  devise_for :users
  get 'welcome/index'
  root :to => 'welcome#index'
  resources :users, only: [:index, :show]
  get 'search_person', to: "search_person#index"
  get 'search_question', to: "search_question#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
