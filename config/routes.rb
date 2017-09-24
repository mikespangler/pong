Rails.application.routes.draw do

  # get 'game/create'
  # get 'game/show'
  # get 'game/update'
  # get 'game/delete'

  # get 'player/create'
  # get 'player/show'
  # get 'player/update'
  # get 'player/delete'
  resources :player
  resources :game

  resources :score, only: [:create, :destroy], param: :game_id

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
