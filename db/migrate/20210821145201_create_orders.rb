class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.boolean :guest?, default: true
      t.string :status, default: "pending"
      t.string :checkout_session_id
      t.monetize :amount, currency: { present: false }
      t.timestamps
    end
  end
end
