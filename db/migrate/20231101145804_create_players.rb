class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.boolean :president, default: false
      t.boolean :chancelier, default: false

      t.timestamps
    end
  end
end
