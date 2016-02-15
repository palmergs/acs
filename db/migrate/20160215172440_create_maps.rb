class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.integer :adventure_id,    null: false, index: true
      t.string :name,             null: false
      t.text :description,        null: false, default: ''
      t.integer :width,           null: false, default: 40
      t.integer :height,          null: false, default: 40

      t.timestamps
    end
  end
end
