Rails.application.routes.draw do
  resources :resources, only: [:index]
  match "oauth/confirm_access", to: "oauth#confirm_access", via: [:get, :post]
  get "/import_poi", to: "application#import_poi"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
