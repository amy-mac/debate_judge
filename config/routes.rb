DebateJudge::Application.routes.draw do

  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: :login

  root to: 'main#index'
  match '*path', to: 'main#index'

  scope "api" do
    resources :tournaments
    resources :rounds
    resources :contentions
  end

end
