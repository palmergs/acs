class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.integer :map_id,    null: false, index: true
      t.string :name,       null: false
      t.text :description,  null: false, default: ''
      t.integer :width,     null: false, default: 40
      t.integer :height,    null: false, default: 40
      t.integer :x
      t.integer :y
      t.integer :tile_picture_id
      t.text :enter
      t.text :leave

      t.timestamps
    end
  end
end
