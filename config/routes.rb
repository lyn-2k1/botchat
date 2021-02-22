Rails.application.routes.draw do
  resources :faceapis
  resources :facebookapis
  resources :trainbots
  resources :uttrances
  resources :lists
  resources :wit_key
  resources :wit_entities
  resources :wit_simo
  resources :training


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
