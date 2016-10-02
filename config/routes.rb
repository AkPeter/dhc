Rails.application.routes.draw do

  # devise_for :users

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end

  get 'main/index'
  root 'main#index'

  resources :works, :users

end
