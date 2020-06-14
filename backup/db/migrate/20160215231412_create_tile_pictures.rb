class CreateTilePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :tile_pictures do |t|
      t.integer :user_id,       index: true
      t.integer :adventure_id,  index: true
      t.string :name,           null: false, limit: 63
      t.text :description,      null: false, default: ''
      t.string :path,           null: false
      t.string :category,       null: false, limit: 31
      t.string :setting,        null: false, limit: 31

      t.timestamps
    end
  end
end
