class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.string :type,             null: false, limit: 63
      t.integer :adventure_id,    null: false, index: true
      t.integer :tile_picture_id, null: false, index: true
      t.string :activate_on,      limit: 31
      t.integer :spell_id
      t.string :name,             null: false, limit: 63
      t.text :description,        null: false, default: ''
      t.integer :weight,          null: false, default: 0
      t.integer :value,           null: false, default: 0
      t.boolean :disappear,       null: false, default: true
      t.integer :power,           null: false, default: 0
      t.integer :attack_adj,      null: false, default: 0
      t.integer :breakability,    null: false, default: 0
      t.boolean :magic,           null: false, default: false
      t.boolean :owner_only,      null: false, default: false
      t.integer :range,           null: false, default: 0
      t.text :pickup
      t.text :drop
      t.integer :max_carry,       null: false, default: 25000
      t.integer :max_stack,       null: false, default: 1

      t.timestamps
    end
  end
end
