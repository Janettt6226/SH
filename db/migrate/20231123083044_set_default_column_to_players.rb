class SetDefaultColumnToPlayers < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :position, :integer, default: 0
  end
end
