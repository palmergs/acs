class CreateAdventures < ActiveRecord::Migration[5.0]
  def change
    create_table :adventures do |t|
      t.string :name,           null: false, limit: 63
      t.text :description,      null: false, default: ''
      t.text :intro
      t.string :rating,         null: false, limit: 31, default: Adventure::RATING_GENERAL
      t.string :access,         null: false, limit: 31, default: Adventure::ACCESS_PRIVATE

      t.timestamps
    end
  end
end
