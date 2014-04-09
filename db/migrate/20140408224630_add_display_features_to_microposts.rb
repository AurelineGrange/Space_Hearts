class AddDisplayFeaturesToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :allow_display, :boolean
    add_column :microposts, :has_been_paid, :boolean
    add_column :microposts, :content_public, :boolean
  end
end
