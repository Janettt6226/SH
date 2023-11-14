class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @players = @game.players
    @player = Player.new
    @stacks = @game.stacks
    @president = @players.sample
    @president.president = true
    @chancelier = @players.select{ |player| player.chancelier? }
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:game_id)
  end
end
