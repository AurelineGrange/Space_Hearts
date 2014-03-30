class StaticPagesController < ApplicationController
  def help
  end

  def contact
  end

  def pricing
  end

  def about
  end

  def home
    @home_search= String.new
  end

end
