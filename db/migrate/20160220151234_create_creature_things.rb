class CreateCreatureThings < ActiveRecord::Migration[5.0]
  def change
    create_table :creature_things do |t|
      t.integer :creature_id,   null: false, index: true
      t.integer :thing_id,      null: false, index: true
      t.integer :count,         null: false, default: 1
      t.boolean :equipped,      null: false, default: false

      t.timestamps
    end
  end
end
