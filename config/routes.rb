Rails.application.routes.draw do
  resources :candidates, only: [:new, :create]

  root "candidates#new"
end
