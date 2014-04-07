class ErrorsController < ApplicationController

	def show
		render status_code.to_s, :status => status_code
	end


	def maintenance
		render 'maintenance'
	end

	private

	def status_code
		params[:code] || 500
	end

end