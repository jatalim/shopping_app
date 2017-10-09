class AddPublicUserToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :public_user, foreign_key: true
  end
end
