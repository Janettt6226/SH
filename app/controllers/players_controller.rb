class PlayersController < ApplicationController
  before_action :set_player, only: %i[edit update update_president]
  before_action :set_game, only: %i[create update_positions save_positions]

  def new
    @players = Player.where(game_id: params[:game_id])
    @round = Round.new
  end

  def create
    @player = Player.new(player_params)
    @player.game_id = @game.id
    if @player.save!
      redirect_to game_setup_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    # if @player.chancelier = true
    #   @player.update!(player_params)
    # elsif @player.position = 1
    #   @player.president = true
    #   @player.update!(player_params)
    # elsif @player.position > 1
    #   @player.update!(player_params)
    # end
  end

  def update_president
  end

  def save_president
    @game = Game.find(params[:game_id])
    @players = @game.players
    @players.each do |player|
      if player.president = true
        player.update!(president: false)
      end
    end
    @player = @game.players.find_by(user_id: params[:game][:players])
    @player.update!(president: true)
  end

  def update_chancelier
  end

  def save_chancelier
    @game = Game.find(params[:game_id])
    @players = @game.players
    @players.each do |player|
      if player.chancelier = true
        player.update!(chancelier: false)
      end
    end
    @player = @game.players.find_by(user_id: params[:game][:players])
    @player.update!(chancelier: true)
  end

  # def update_positions
  #   @players = @game.players
  #   puts @players.inspect
  #   @player = @game.players.find(params[:id])
  # end

  # def save_positions
  #   @players = Player.where(game_id: @game.id)
  # end


  private

  def player_params
    params.require(:player).permit(:chancelier, :president, :game_id, :username, :position, :user_id, selected_usernames: [])
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  # TESTS BELOW

  def player_params_for_president
    params.require(:players).map { |p| p.permit(:president) }
  end

  def player_params_for_positions
    params.require(:players).map { |p| p.permit(:position) }
  end
  # ============================================================
end
