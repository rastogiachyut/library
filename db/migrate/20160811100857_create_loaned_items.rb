class CreateLoanedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :loaned_items do |t|
      t.references :inventory_item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.decimal :loaned_quantity
      t.timestamps null: false
    end
  end
end
