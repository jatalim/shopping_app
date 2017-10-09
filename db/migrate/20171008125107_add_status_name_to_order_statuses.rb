class AddStatusNameToOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :order_statuses, :status_name, :string
  end
end
