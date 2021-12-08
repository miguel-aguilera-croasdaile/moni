class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status, default: "pending"
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
