 class MicropostsController < ApplicationController
 	before_action :signed_in_user, only: [:destroy]
 	before_action :admin_user,     only: [:destroy]


 	def new
 		@micropost = Micropost.new
 	end

 	def chose_web_only
 		@micropost = Micropost.new
 	end

 	def finalize_order
 		@finalize = current_user.microposts.last
 		@user = current_user
 	end

 	def check_finalize
 		@finalize = current_user.microposts.last
 		@user = current_user
 		if @finalize.update_attributes(finalize_params)
 			@finalize.to_pay = 0
 			@finalize.update_attributes(to_pay: @finalize.standard_price)

 			#if the user has already signed up with his email, let's merge his accounts
 			if user_params[:email].empty?
 				#we have an anonymous user
 			elsif User.find_by(email: user_params[:email])
 				#merge
 				@finalize.update_attributes(user_id: User.find_by(email: user_params[:email]).id)
 			else
 				#update user info normally.
 				if @user.update_attributes(user_params)
					flash[:success] = "Account created"
				else
					render 'edit'
				end
 			end

 			#Now let's go back to our business
			flash[:success] = "All info updated"
      		redirect_to last_step_path
		else
			render 'ready_to_launch'
		end
 	end

 	def payment
 		@user=current_user
 		@micropost = current_user.microposts.last
 	end


 	def display
	    #secret keys are case insensitive
	    @heart_item= Micropost.find_by_secret_key(params[:secret_key].downcase)
	    if @heart_item
	      #render 'display'
	    else
	      flash[:failure] = "The secret key you entered is not valid"
	      redirect_to root_url
	    end
  	end

 	def create
 		@micropost = Micropost.new(micropost_params)
 		if @micropost.save
 			flash[:success] = "We're already working on your letter! Just add a few details now!"
 			redirect_to ready_to_launch_path
 		else
 			@home_search= String.new
 			if micropost_params[:launch_into_space]
 				render 'new'
 			elsif !micropost_params[:launch_into_space]
 				render 'chose_web_only'
 			else
 				redirect_to root_url
 			end
 		end
 	end

 	def show
 		@micropost = Microposts.find(params[:secret_key])
 	end

 	def destroy
 	end

 	def index
 		@heart_items= Microposts.all
 	end

 	def heart_wall_xml
 		@heart_items= Micropost.where("launch_into_space = ?", true)
 		@diminished_heart_items= Array.new
 		@heart_items.each do |heart_item|
 			@diminished_heart_items.push(heart: [name1: heart_item.name1 , name2: heart_item.name2])
 		end
 		render xml: @diminished_heart_items
  	end

 	private

 	def micropost_params
 		params.require(:micropost).permit(:content, :name1, :name2, :extra, :send_email_to_partner, 
 			:send_paper_copy, :launch_into_space, :user_id, :secret_key, :assigned_secret)
 	end

 	def finalize_params
 		params.require(:micropost).permit(:launch_into_space, :secret_key, :partner_name, :partner_email, 
 			:mail_street, :mail_street2, :mail_cp, :mail_city, :mail_state, :mail_country)
 	end

 	def user_params
 		params.require(:user).permit(:name, :email, :password, :password_confirmation, :redirect_to)
 	end

 end




