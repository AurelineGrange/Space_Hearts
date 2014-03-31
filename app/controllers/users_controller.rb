class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @params= user_params
    @user = User.new    # Not the final implementation!
    @user.name=@params[:name]
    @user.email=@params[:email]
    @user.password=@params[:password]
    @user.password_confirmation=@params[:password_confirmation]
    if @user.email=="jc.gasche@mac.com" || @user.email=="aurelinegrange@me.com"
      @user.update_attributes(admin: true)
    end
    if @user.save
      sign_in @user
      #flash[:success] = "Welcome to the Heart Space Mission !"
      if @params[:redirect_to]== "choice-vip"
        redirect_to vip_path
      elsif @params[:redirect_to]== "choice-space"
        redirect_to micropost_path
      elsif @params[:redirect_to]== "choice-web"
        redirect_to micropost_path
      else
      redirect_to @user
      end
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      if @user.email=="jc.gasche@mac.com" || @user.email=="aurelinegrange@me.com"
        @user.update_attributes(admin: true)
      end
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :redirect_to)
  end

  # Before filters

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in !"
      end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end
