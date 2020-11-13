Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, except: %i[index] do
    resources :doses, only: %i[create new]
    resources :reviews, only: %i[create new]
  end
  resources :doses, only: %i[destroy]
  resources :reviews, only: %i[destroy]
end
