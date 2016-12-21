Rails.application.routes.draw do 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'sessions#new'
  resources :sessions, only: :index
  resource :dashboard, only: :show
  resources :tasks, only: [:index, :create]
  get "/auth/:provider/callback" => 'sessions#create'
  resource :dashboard, only: :show
  resources :tasks, only: [:index,:create]

  resources :users do
    resources :projects, controller: "users/projects" do
      resources :categories, controller: "users/categories"
    end
  end
  namespace :time_reported do
    resources :billables, only: :index
  end
  namespace :reports do
    resource :weekly_reports, only: :show
  end
end
