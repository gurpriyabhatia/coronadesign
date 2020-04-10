Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :designs, only: [:index, :show ]

root to: "designs#index", as: :unauthenticated_root

# authenticated :user do
#   root :to => "home#dashboard"
# end
end
