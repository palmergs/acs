class CreateAdventures < ActiveRecord::Migration[6.0]
  def change
    create_table :adventures do |t|
      t.string :name, null: false, limit: 100
      t.string :slug, null: false, limit: 100
      t.text :descr, null: false, default: ''
      t.text :intro
      t.string :rating, null: false, limit: 32, default: 'general'
      t.string :genre, null: false, limit: 32, default: 'fantasy'
      t.string :access, null: false, limit: 32, default: 'private'

      t.timestamps
    end
  end
end
