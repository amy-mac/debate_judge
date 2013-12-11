DebateJudge::Application.routes.draw do

  scope "api" do
    resources :tournaments
    resources :users, except: [:index]
  end
  
  resources :sessions, only: [:create, :destroy]

  root to: 'main#index'
  match '*path', to: 'main#index'
end
