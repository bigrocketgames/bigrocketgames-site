Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#home', as: 'home'

  namespace :blog do
    root 'posts#index', as: 'home'
    resources :posts
    resources :comments
  end
  
end
