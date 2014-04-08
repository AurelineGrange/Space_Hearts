class ErrorsController < ApplicationController
	before_action :admin_user,     only: [:admin_pannel_user,:admin_pannel_posts]

	def show
		#render status_code.to_s, :status => status_code
		render '404'
	end


	def maintenance
	end

	private

	def status_code
		params[:code] || 500
	end

	
	private

	def admin_user
    	redirect_to(root_url) unless current_user.admin?
  	end


end