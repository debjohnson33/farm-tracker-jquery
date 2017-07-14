class FarmsController < ApplicationController
	def index
		@farms = Farm.all
	end

	def show
		@farm = Farm.find(params[:id])
	end

	def new
		@farm = Farm.new
		@user = current_user
	end

	def create
		@farm = Farm.create(farm_params)
		render :show
	end


	private

	def farm_params
		params.require(:farm).permit(:name, :user_id)
	end
end