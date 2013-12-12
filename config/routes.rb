DebateJudge::Application.routes.draw do

  scope "api" do
    resources :tournaments
    resources :rounds
    resources :users, except: [:index]
  end
  
  post '/sessions', to: 'sessions#create'
  post '/sessions/destroy', to: 'sessions#destroy'

  root to: 'main#index'
  match '*path', to: 'main#index'
end
