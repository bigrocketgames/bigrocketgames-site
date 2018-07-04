Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  root 'static#home', as: 'home'
  get 'about', to: 'static#about'

  resources :contact, only: [:new, :create]
  get '/contact', to: 'contact#new'

  namespace :blog do
    root 'posts#index', as: 'home'
    resources :posts, only: [:index, :show]
    resources :comments, only: [:create]
  end

  namespace :admin do
    root 'admin#home', as: 'home'
    resources :posts
    resources :mobile_games
    resources :browser_games
    resources :portfolio
  end

  namespace :games do
    resources :mobile_games, only: [:index, :show]
    resources :browser_games, only: [:index, :show]
  end

  resources :portfolio, only: [:index, :show]

  # Voter registration tool pages
  namespace :voter_tools do
    root 'voter_tools#home', as: 'home'
    get 'voter-registration', to: 'voter#registration'
    get 'absentee-ballot', to: 'voter#absentee'
    get 'voter-registration-status', to: 'voter#status'
    get 'election-reminder-tools', to: 'voter#reminders'
  end
  
end
