class AddFlagFeaturesToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :flag, :boolean
    add_column :microposts, :paper_version_sent, :boolean
    add_column :microposts, :email_sent, :boolean
  end
end
