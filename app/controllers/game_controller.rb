class GameController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  def create
    @game = Game.create!(game_params)
    json_response(@game, :created)
  end

  def show
    json_response(@game)
  end

  def update
  end

  def delete
  end

  private

  def game_params
    # whitelist params
    params.permit(:player_1_id, :player_2_id, :finished)
  end
    def set_game
    @game = Game.find(params[:id])
  end
end
