class StaticPagesController < ApplicationController
  def help
  end

  def contact
  end

  def pricing
  end

  def choice
    @user = User.new
  end

  def vip
  end

  def about
  end

  def home
    @home_search= String.new
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :redirect_to)
  end

end
