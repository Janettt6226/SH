class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @game = Game.find(params[:game_id])
    @player.game_id = @game.id
    @player.save!
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player.chancelier = true
    @player.update
  end

  private

  def player_params
    params.require(:player).permit(:chancelier, :president, :game_id, :user_id)
  end

end
