class CreateStoreThings < ActiveRecord::Migration[5.0]
  def change
    create_table :store_things do |t|
      t.integer :store_id,    null: false, index: true
      t.integer :thing_id,    null: false, index: true
      t.integer :count,       null: false, default: 1

      t.timestamps
    end
  end
end
