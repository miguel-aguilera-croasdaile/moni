class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.string :description
      t.integer :stock
      t.float :price
      t.boolean :made_to_order?, default: false
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
