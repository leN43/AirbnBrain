Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
<<<<<<< HEAD
  root to: "pages#home"
=======
  root to: "home#index"
>>>>>>> a2329e364873dcbe31b643f7302c07d1f38fdd11
=======
  root to: "pages#home"
>>>>>>> dff129367948e579137468bea0b29cca9921c8b5
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :brains do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: %i[index show destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
