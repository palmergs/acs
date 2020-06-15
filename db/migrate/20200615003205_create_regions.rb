class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.belongs_to :adventure, null: false, foreign_key: true
      t.string :name, null: false, limit: 200
      t.text :descr, null: false, default: ''
      t.integer :width, null: false, default: 40
      t.integer :height, null: false, default: 40

      t.timestamps
    end
  end
end
