class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :total 
      t.timestamps
    end
  end
end
