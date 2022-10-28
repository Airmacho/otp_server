Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'otp_codes', to: 'otp#create'
  post 'otp_codes/verify', to: 'otp#verify'
end
