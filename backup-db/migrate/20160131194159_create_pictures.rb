class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :name,         null: false, limit: 48
      t.string :slug,         null: false, limit: 48, index: true
      t.text :description,    null: false, default: ''
      t.string :path,         null: false
      t.string :category,     null: false, limit: 48

      t.timestamps
    end
  end
end
