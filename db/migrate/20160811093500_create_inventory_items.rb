class CreateInventoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_items do |t|
      t.references :book, index: true, foreign_key: true
      t.decimal :available_quantity
      t.decimal :total_quantity
      t.timestamps null: false
    end
  end
end
