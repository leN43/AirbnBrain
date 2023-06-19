Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  root to: "pages#home"
=======
  root to: "home#index"
>>>>>>> a2329e364873dcbe31b643f7302c07d1f38fdd11
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
