class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.belongs_to :region, null: false, foreign_key: true
      t.string :name, null: false
      t.text :descr, null: false, default: ''
      t.integer :width, null: false, default: 10
      t.integer :height, null: false, default: 10
      t.integer :region_x, null: false, default: 0
      t.integer :region_y, null: false, default: 0
      t.integer :wall_tile_idx, null: false, default: 0

      t.timestamps
    end
  end
end
