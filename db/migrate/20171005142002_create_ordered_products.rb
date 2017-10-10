class CreateOrderedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_products do |t|
      t.integer :product_quantity
      t.decimal :product_price 
      t.timestamps
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
