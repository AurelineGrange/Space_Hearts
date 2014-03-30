class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id
      t.string :secret_key
      t.boolean :launch_into_space, default: true
      t.boolean :send_email_to_partner, default: false
      t.boolean :send_paper_copy, default: false
      t.string :name1
      t.string :name2
      t.string :extra
      t.integer :extra_id

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
