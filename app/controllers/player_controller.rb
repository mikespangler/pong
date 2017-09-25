class PlayerController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  def create
    @player = Player.create!(player_params)
    json_response(@player, :created)
  end

  def show
    json_response(PlayerSerializer.new(@player))
  end

  def update
    @player.update(player_params)
    json_response(@player, :updated)
  end

  def destroy
    @player.destroy!
    json_response({"msg": "player #{@player.id} deleted."}, :ok)
  end

  def index
    @players = Player.all
    json_response(@players)
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
