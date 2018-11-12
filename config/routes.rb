Rails.application.routes.draw do
  devise_for :users
  resources :itinerarios
  #resources :ciudads
  #resources :pais

  #resources :publicacions
  #resources :comentarios
  resources :search

  #resources :publicacions
  #resources :comentarios

  get 'welcome/index'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'

  resources :pais do
    resources :ciudads do
      resources :publicacions do
        resources :comentarios
      end
    end
  end

  resources :publicacions do
    member do
      put "like" =>"publicacions#upvote"
      put "unlike" => "publicacions#downvote"
    end
  end

  resources :comentarios do
    member do
      put "like" =>"comentarios#upvote"
      put "unlike" => "comentarios#downvote"
    end
  end
end
