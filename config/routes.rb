Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  get 'home/index'
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'edit_account', to: 'users/registrations#edit_account'
  end

  resources :users do
    resources :reservations
    member do
      get 'profile'
      get 'account'
      get 'confirm', to: 'reservations#confirm'
    end
  end

  root to: "home#index"

  resources :rooms do
    collection do
      get 'search'
      get 'own'
    end
  end
end
