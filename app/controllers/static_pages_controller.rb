class StaticPagesController < ApplicationController
  def help
  end

  def contact
  end

  def pricing
  end

  def privacy
  end

  def payment_success
  end

  def qrcode
    render partial: 'qrcode'
  end

  def choice
    @user = User.new
  end

  def search_with_secret_key
    #secret keys are case insensitive
    @micropost= Micropost.find_by_secret_key(search_params.downcase)
    if @micropost
      redirect_to "/secret/#{@micropost.secret_key.to_s}"
    else
      flash[:failure] = "The secret key you entered is not valid"
      redirect_to root_url
    end
  end

  def vip
  end


  def about
  end

  def home
    @home_search= String.new
    @user = User.new
    #only launch into space displayed here. but later only "has been paid=true" will be displayed
    @heart_items= Micropost.where("allow_display = ?", true)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :redirect_to)
  end

  def search_params
    params.require(:secret_key)
  end

end
