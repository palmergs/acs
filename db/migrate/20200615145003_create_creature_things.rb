class CreateCreatureThings < ActiveRecord::Migration[6.0]
  def change
    create_table :creature_things do |t|
      t.belongs_to :creature, null: false, foreign_key: true
      t.belongs_to :thing, null: false, foreign_key: true
      t.integer :count
      t.boolean :equipped
      t.integer :drop_percent

      t.timestamps
    end

    add_index :creature_things, [:creature_id, :thing_id], unique: true, name: :idx_unique_creature_things
  end
end
