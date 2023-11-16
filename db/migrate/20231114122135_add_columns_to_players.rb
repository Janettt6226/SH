class AddColumnsToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :role, :string
    add_column :players, :parti, :string
    add_column :players, :killed, :boolean, default: false
  end
end
