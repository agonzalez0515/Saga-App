Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#index'

  resource :school, only: [:show] do
    resources :teachers
    resources :students do
      patch  "/teams", to: 'student#update_team'
      delete "/teams", to: 'student#destroy_team'
    end
  end
end
