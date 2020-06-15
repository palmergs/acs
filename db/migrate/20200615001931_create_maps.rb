class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.belongs_to :adventure, null: false, foreign_key: true
      t.string :name, limit: 100, null: false
      t.text :descr, null: false, default: ''
      t.integer :width, null: false, default: 40
      t.integer :height, null: false, default: 40

      t.timestamps
    end
  end
end
