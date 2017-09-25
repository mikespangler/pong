class ScoreController < ApplicationController
  before_action :set_game, only: [:create, :destroy]

  def create
    @score = Score.create!(score_params)
    @game.update_stats!
    @game.reload
    json_response(@game, :ok)
  end  

  def destroy
    @game.rewind!
    json_response({"msg": "Last score for game #{@game.id} removed."}, :ok)
  end

  private

  def score_params
    # whitelist params
    params.permit(:game_id, :player_id)
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
