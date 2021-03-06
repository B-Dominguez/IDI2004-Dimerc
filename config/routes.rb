Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root :to => 'welcome#index'
  get 'search_person', to: "search_person#index"
  get 'search_person/results', to: "search_person#show"
  patch 'search_person', to: "search_person#update"
  # buesqueda de trabajadores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
