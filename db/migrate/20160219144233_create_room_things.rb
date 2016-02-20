class CreateRoomThings < ActiveRecord::Migration[5.0]
  def change
    create_table :room_things do |t|
      t.integer :room_id,   null: false, index: true
      t.integer :thing_id,  null: false, index: true
      t.integer :x,         null: false, index: true
      t.integer :y,         null: false, index: true
      t.integer :z,         null: false, index: true

      t.timestamps
    end
  end
end
