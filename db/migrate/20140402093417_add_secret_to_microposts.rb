class AddSecretToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :assigned_secret, :string
  end
end
