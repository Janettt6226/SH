class CreateStacks < ActiveRecord::Migration[7.0]
  def change
    create_table :stacks do |t|
      t.string :law
      t.boolean :used, default: false
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
