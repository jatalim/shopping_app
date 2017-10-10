class AddOmniauthToPublicUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :public_users, :provider, :string
    add_column :public_users, :uid, :string
    add_column :public_users, :name, :string
    add_column :public_users, :image, :text
  end
end
