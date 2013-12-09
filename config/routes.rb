DebateJudge::Application.routes.draw do

  scope "api" do
    resources :tournaments
  end
  
  resources :users

  root to: 'application#index'
end
