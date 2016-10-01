Rails.application.routes.draw do

  devise_for :users
  get 'main/index'
  root 'main#index'

  resources :works

end
