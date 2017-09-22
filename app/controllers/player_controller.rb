class PlayerController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  def create
    @player = Player.create!(player_params)
    json_response(@player, :created)
  end

  def show
    json_response(@player)
  end

  def update
  end

  def delete
    @player.destroy!
    head :no_content
  end

  private

  def player_params
    # whitelist params
    params.permit(:name)
  end
    def set_player
    @player = Player.find(params[:id])
  end
end
