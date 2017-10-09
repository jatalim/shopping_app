class AddOrderToCartedProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carted_products, :order, foreign_key: true
  end
end
