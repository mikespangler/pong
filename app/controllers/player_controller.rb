class PlayerController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy, :history]

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

  def history
    @opposing_player = Player.find(params[:opposing_player_id])
    json_response(@player.history(@opposing_player))
  end

  private

  def player_params
    # whitelist params
    params.permit(:name, :opposing_player_id)
  end
  def set_player
    @player = Player.find(params[:id])
  end
end
