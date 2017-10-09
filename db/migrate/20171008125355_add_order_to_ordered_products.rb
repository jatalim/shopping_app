class AddOrderToOrderedProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :ordered_products, :order, foreign_key: true
  end
end
