class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.string :photo_url
      t.timestamps
    end
  end
end
