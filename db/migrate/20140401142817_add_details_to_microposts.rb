class AddDetailsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :partner_name, :string
    add_column :microposts, :partner_email, :string
    add_column :microposts, :mail_street, :string
    add_column :microposts, :mail_street2, :string
    add_column :microposts, :mail_cp, :string
    add_column :microposts, :mail_city, :string
    add_column :microposts, :mail_state, :string
    add_column :microposts, :mail_country, :string
    add_column :microposts, :to_pay, :integer
  end
end
