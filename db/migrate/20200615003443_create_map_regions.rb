# frozen_string_literal: true

class CreateMapRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :map_regions do |t|
      t.belongs_to :map, null: false, foreign_key: true
      t.belongs_to :region, null: false, foreign_key: true

      t.integer :map_x, null: false, default: 20
      t.integer :map_y, null: false, default: 20

      t.integer :region_x, null: false, default: 20
      t.integer :region_y, null: false, default: 20
     
      t.string :travel, null: false, limit: 50, default: 'ask-before'
      t.text :enter_region

      t.timestamps
    end
  end
end
