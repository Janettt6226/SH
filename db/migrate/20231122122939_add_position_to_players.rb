class AddPositionToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :position, :integer
  end
end
