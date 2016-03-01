class AddReadiedStatusToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :readied, :boolean, default: false, null: false
  end
end
