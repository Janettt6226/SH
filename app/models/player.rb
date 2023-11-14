class Player < ApplicationRecord
  # belongs_to :user, foreign_key: "username", primary_key: "username"
  belongs_to :user
  belongs_to :game
  validates :user_id, uniqueness: { scope: :game_id, message: "Already participate to this game" }
end
