class Round < ApplicationRecord
  belongs_to :game
  has_many :players, through: :game

  PILE = %w[Libérale Libérale Libérale Libérale Libérale Libérale Fasciste Fasciste Fasciste Fasciste Fasciste Fasciste Fasciste Fasciste Fasciste Fasciste Fasciste]

  DISCARD = []
end
