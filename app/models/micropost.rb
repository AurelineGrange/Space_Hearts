class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  before_save {self.secret_key = secret_key.downcase}
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :secret_key, presence: true, uniqueness: { case_sensitive: false}
  #validates :launch_into_space, presence: true
  #validates :send_paper_copy, presence: true
  #validates :send_email_to_partner, presence: true
  validates :name1, presence: true
  validates :name2, presence: true



  def standard_price
    @price = 0

    if self.launch_into_space
      @price= 398 + @price
    else
      @price= 20 + @price
    end

    unless self.secret_key == self.assigned_secret
      @price= 30 + @price
    end

    unless self.mail_street.empty? || self.mail_street2.empty?
      @price=  50 + @price
    end

    return @price
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    #Micropost.where("user_id = ?", id)
    Micropost.all
  end


end

