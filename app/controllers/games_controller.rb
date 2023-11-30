class GamesController < ApplicationController
  before_action :set_game, only: %i[show]

  def show
    @players = @game.players
    @player = Player.new
    @stacks = @game.stacks
    # @president = @players.sample
    # @president.president = true
    # @chancelier = @players.select{ |player| player.chancelier? }
  end

  def setup
    @game = Game.find(params[:game_id])
    @player = Player.new
    @players = @game.players

    if @players.count == 7
      set_roles
    end
    @round = Round.new
  end

  def new
    @game = Game.new
  end

  def create
    if @game = Game.save(game_params)
    Player.create(game_id: @game.id, user: current_user)
    redirect_to @game
    else
      render :see_other, status: :unprocessable_entity
    end

  end

  private

  def game_params
    params.require(:game).permit(:game_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_roles
    @available_roles = Player::ROLES.dup
    @available_parties = Player::PARTIS.dup

    @players.each do |player|
      @available_roles.shuffle
      @available_parties.shuffle
      player.role = @available_roles.first
      player.parti = @available_parties.first

      player.update!(role: player.role, parti: player.parti)

      @available_roles.shift
      @available_parties.shift
    end
  end
end
