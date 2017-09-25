class GameController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = Game.all
    json_response(@games)
  end

  def create
    @game = Game.create!(game_params)
    json_response(@game, :created)
  end

  def show
    json_response(GameSerializer.new(@game))
  end

  def update
    @game.update(game_params)
    json_response(@game, :updated)
  end

  def destroy
    @game.delete
    json_response({"msg": "#{@game.id} deleted."}, :ok)
  end

  private

  def game_params
    # whitelist params
    params.permit(:player_1_id, :player_2_id, :finished, :service)
  end
  def set_game
    @game = Game.find(params[:id])
  end
end
