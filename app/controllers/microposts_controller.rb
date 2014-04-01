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
 		@finalize= finalize_params
 		@micropost= current_user.microposts.last
 		unless current_user.microposts.last.secret_key == finalize_params[secret_key]
 			@micropost.to_pay = @micropost.to_pay + 30 
 		end
 		if current_user.microposts.last.update_attributes[finalize_params]
 			redirect_to last_step_path
 		else
 			render 'ready_to_launch'
 		end
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
 		params.require(:micropost).permit(:content, :name1, :name2, :extra, :send_email_to_partner, 
 			:send_paper_copy, :launch_into_space, :user_id, :secret_key)
 	end

 	def finalize_params
 		params.require(:micropost).permit(:launch_into_space, :secret_key, :partner_name, :partner_email, 
 			:mail_street, :mail_street2, :mail_cp, :mail_city, :mail_state, :mail_country)
 	end

 	def user_params
 		params.require(:user).permit(:name, :email, :password, :password_confirmation, :redirect_to)
 	end

 	def standard_price
 		@price = 0
 		if self.launch_into_space
 			@price= 398 + self.to_pay
 		else
 			@price= 20 + self.to_pay
 		end

		unless self.mail_street.empty?
 			@price= price + 50
 		end
 		return @price
 	end

 end




