class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :secret_key, presence: true
  #validates :launch_into_space, presence: true
  #validates :send_paper_copy, presence: true
  #validates :send_email_to_partner, presence: true
  validates :name1, presence: true
  validates :name2, presence: true


end

