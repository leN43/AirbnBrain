Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :brains do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: %i[index show destroy]

  get "/dashboard", to: "pages#dashboard", as: :dashboard
  # Defines the root path route ("/")
  # root "articles#index"
end
