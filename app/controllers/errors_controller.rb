class ErrorsController < ApplicationController

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

end