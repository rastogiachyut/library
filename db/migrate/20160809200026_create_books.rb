class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :text
      # t.integer :copies
      # t.integer :available_copies

      t.timestamps
    end
  end
end
