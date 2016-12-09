Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :schools, only: [:show] do
    resources :teams, except: [:index]
    # post "/teams", to: 'teams#create', as: nil

    resources :teachers, except: [:new, :create]
    resources :students do
      patch  "/teams", to: 'student#update_team'
      delete "/teams", to: 'student#destroy_team'
    end
  end

  get "/teachers/new", to: 'teachers#new'
  post "/teachers", to: 'teachers#create', as: nil

  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
end
