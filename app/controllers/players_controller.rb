class PlayersController < ApplicationController

  def new
    # @player = Player.new
  end

  def create
    @game = Game.find(params[:game_id])
    @player = Player.new(player_params)
    @player.game_id = @game.id
    if @player.save!
      redirect_to @game
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:player).permit(:chancelier, :president, :game_id, :username, :position, :user_id, selected_usernames: [])
  end

end
