class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.integer :liberal, default: 0
      t.integer :fascist, default: 0
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
