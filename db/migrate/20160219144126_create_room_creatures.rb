class CreateRoomCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :room_creatures do |t|
      t.integer :room_id,     null: false, index: true
      t.integer :creature_id, null: false, index: true
      t.integer :x,           null: false, index: true
      t.integer :y,           null: false, index: true

      t.timestamps
    end
  end
end
