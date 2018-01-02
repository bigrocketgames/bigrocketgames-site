Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :blog do
    resources :posts
    resources :comments
  end
  
end
