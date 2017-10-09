class AddProductPriceToCartedProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :carted_products, :product_price, :decimal
  end
end
