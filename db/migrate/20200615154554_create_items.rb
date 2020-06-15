class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :thing, null: false, foreign_key: true
      t.belongs_to :room, foreign_key: true
      t.belongs_to :actor, foreign_key: true
      t.integer :x, null: false, default: 0
      t.integer :y, null: false, default: 0
      t.integer :z, null: false, default: 0
      t.boolean :readied, null: false, default: false

      t.timestamps
    end
  end
end
