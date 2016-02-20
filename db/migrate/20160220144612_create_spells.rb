class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.string :type,           null: false, limit: 31, index: true 
      t.integer :adventure_id,  null: false, index: true
      t.string :name,           null: false, limit: 63
      t.text :description,      null: false, default: ''
      t.text :activate
      t.integer :creature_id
      t.integer :thing_id

      t.timestamps
    end
  end
end
