class ScoreController < ApplicationController
  def create
    @score = Score.create!(score_params)
    json_response(@score, :created)
  end  

  def delete
    @score = Score.find(params[:id])
    @score.destroy!
    json_response(head, :no_content)
  end

  private

  def score_params
    # whitelist params
    params.permit(:game_id, :player_id)
  end
end
