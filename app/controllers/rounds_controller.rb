class RoundsController < ApplicationController
  before_action :set_game, only: [:index, :show, :create]
  before_action :set_round, only: [:show]


  def index
    @rounds = @game.rounds
  end

  def show
    @players = @game.players
    @president = @players.find_by(president: true).user.username
    @chancelier = @players.find_by(chancelier: true).user.username
  end

  def new
    @round = Round.new
  end

  def create
    if @round = Round.create(game_id: @game.id)
      redirect_to game_round_path(@game, @round)
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_round
    @round = Round.find(params[:id])
  end

  def shuffle_pile
    PILE.shuffle
  end

  def president_draw
    @president_draw = PILE.first(3)
  end
end
