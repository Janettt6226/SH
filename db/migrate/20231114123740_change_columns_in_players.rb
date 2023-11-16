class ChangeColumnsInPlayers < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :chancelier, :boolean, default: false
    change_column :players, :president, :boolean, default: false
  end
end
