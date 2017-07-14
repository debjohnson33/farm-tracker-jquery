class FarmsController < ApplicationController
	def index
		@farms = Farm.all
		if current_user 
			@user = current_user
		else
			redirect_to root_path
		end
	end
end