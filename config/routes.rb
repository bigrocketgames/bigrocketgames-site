Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#home', as: 'home'
  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'

  namespace :blog do
    root 'posts#index', as: 'home'
    resources :posts
    resources :comments
  end
  
end
