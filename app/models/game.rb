class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :users, through: :players
  has_many :stacks
  has_many :rounds, dependent: :destroy
  has_one :board
end
