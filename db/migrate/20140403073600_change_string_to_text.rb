class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :microposts, :content, :text
  	change_column :microposts, :partner_name, :text
    change_column :microposts, :partner_email, :text
    change_column :microposts, :mail_street, :text
    change_column :microposts, :mail_street2, :text
    change_column :microposts, :mail_cp, :text
    change_column :microposts, :mail_city, :text
    change_column :microposts, :mail_state, :text
    change_column :microposts, :mail_country, :text
    change_column :microposts, :assigned_secret, :text
    change_column :microposts, :secret_key, :text
    change_column :microposts, :name1, :text
    change_column :microposts, :name2, :text
    change_column :microposts, :extra, :text
  end
end
