 class MicropostsController < ApplicationController
 	before_action :signed_in_user, only: [:destroy]
 	before_action :admin_user,     only: [:destroy]


 	def new
 		@micropost = Micropost.new
 	end

 	def create
 		@micropost = Micropost.new(micropost_params)
 		if @micropost.save
 			flash[:success] = "Micropost created!"
 			redirect_to root_url
 		else
 			render 'static_pages/home'
 		end
 	end

 	def show
 		@micropost = Microposts.find(params[:secret_key])
 	end

 	def destroy
 	end

 	def index
 	end

 end




