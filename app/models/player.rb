class Player < ApplicationRecord
  # belongs_to :user, foreign_key: "username", primary_key: "username"
  # belongs_to :user
  belongs_to :user
  belongs_to :game
  validates :user_id, uniqueness: { scope: :game_id, message: "Already participate to this game" }
  # validates :username, uniqueness: { scope: :game_id, message: "Already participate to this game" }
  # attr_accessor :usernames


  ROLES = %w[liberal liberal liberal liberal nazi nazi hitler]
  PARTIS = %w[liberal liberal liberal liberal nazi nazi nazi]

  validate :validate_selected_usernames

  attr_accessor :selected_usernames

  before_validation :assign_user_id

  private

  def assign_user_id
    return unless selected_usernames.present?

    selected_username = selected_usernames.reject(&:blank?).first
    user = User.find_by(username: selected_username)

    self.user_id = user.id if user
  end

  def validate_selected_usernames
    errors.add(:selected_usernames, "Veuillez sélectionner un utilisateur") unless selected_usernames.present? && selected_usernames.reject(&:blank?).count == 1
  end

end
