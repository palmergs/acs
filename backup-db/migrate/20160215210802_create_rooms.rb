class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :region_id,   null: false, index: true
      t.string :name,         null: false, limit: 63
      t.text :description,    null: false, default: ''
      t.integer :width,       null: false, default: 10
      t.integer :height,      null: false, default: 10
      t.integer :x,           null: false
      t.integer :y,           null: false

      t.timestamps
    end
  end
end
