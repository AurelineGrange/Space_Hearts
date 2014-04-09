 class MicropostsController < ApplicationController
 	before_action :signed_in_user, only: [:destroy]
 	before_action :admin_user,     only: [:destroy, :allow_display, 
 		:list_web_posts, :list_space_posts, :admin_pannel_posts]


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
 		@micropost.has_been_paid = false
 		@micropost.allow_display = false
 		@micropost.content_public = false
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
 		@micropost = Micropost.find(params[:id])
 		redirect_to "/secret/#{@micropost.secret_key.to_s}"
 	end

 	def destroy
 		Micropost.find(params[:id]).destroy
    	flash[:success] = "Post deleted."
 		redirect_to admin_pannel_posts_path
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


  	#admin pannel functions

  	def admin_pannel_posts
		@space_posts= Micropost.where("launch_into_space = ?", true)
		@web_posts= Micropost.where("launch_into_space = ?", false)
	end

	def list_space_posts
		@posts= Micropost.where("launch_into_space = ?", true)
		respond_to do |format|
      		format.html { redirect_to admin_pannel_posts_path }
      		format.js
    	end
	end

	def list_web_posts
		@posts= Micropost.where("launch_into_space = ?", false)
		respond_to do |format|
      		format.html { redirect_to admin_pannel_posts_path }
      		format.js
    	end	
    end

	def admin_post_actions
		@params= admin_params
		puts "params"
		puts admin_params
		@post= Micropost.find_by_id(@params[:id])
		puts "post id #{@post.id}"
		if admin_params[:admin_action] == "toggle_allow_display"
			if @post.allow_display?
				@post.allow_display=false
			else
				@post.allow_display=true
			end
			@post.save
		
		elsif admin_params[:admin_action] == "toggle_payment_state"
				
			if @post.has_been_paid?
				@post.has_been_paid=false
			else
				@post.has_been_paid=true
			end
			@post.save
		end

		@posts= Array.new
		@posts.push(@post)

		respond_to do |format|
      		format.html { redirect_to admin_pannel_posts_path }
      		format.js
    	end
	end

    #admin pannel end

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

 	def admin_params
 		params.require(:admin_params).permit(:admin_action, :id, :content, :redirect_to)
 	end

 	def admin_user
    	redirect_to(root_url) unless current_user.admin?
  	end

 end




