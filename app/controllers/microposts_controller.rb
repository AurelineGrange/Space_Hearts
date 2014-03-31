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
 		@micropost = current_user.microposts.first
 	end


 	def create
 		@micropost = Micropost.new(micropost_params)
 		if @micropost.save
 			flash[:success] = "We're already working on your letter! Just add a few details now!"
 			redirect_to ready_to_launch_path
 		else
 			@home_search= String.new
 			redirect_to root_url
 		end
 	end

 	def show
 		@micropost = Microposts.find(params[:secret_key])
 	end

 	def destroy
 	end

 	def index
 	end

 	private

 	def micropost_params
 		params.require(:micropost).permit(:content, :name1, :name2, :extra, :send_email_to_partner, :send_paper_copy, :launch_into_space, :user_id, :secret_key)
 	end




 end




