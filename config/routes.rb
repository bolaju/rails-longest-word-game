Rails.application.routes.draw do
  root to: 'pages#game'
  get 'game', to: 'pages#game', as: :game
  get 'result', to: 'pages#result', as: :result
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
