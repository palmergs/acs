# frozen_string_literal: true

class CreateSpriteMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :sprite_maps do |t|
      t.string :name, null: false
      t.string :path, null: false

      t.integer :sprite_width, null: false, default: 64
      t.integer :sprite_height, null: false, default: 96
      t.integer :width, null: false, default: 640
      t.integer :height, null: false, default: 960

      t.timestamps
    end
  end
end
