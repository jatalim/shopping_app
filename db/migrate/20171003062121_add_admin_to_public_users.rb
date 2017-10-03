class AddAdminToPublicUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :public_users, :admin, :boolean, default: false
  end
end
