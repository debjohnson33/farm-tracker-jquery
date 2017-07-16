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
		@farm.areas.build
		@farm.areas.build
	end

	def create
		
		@farm = Farm.new(farm_params)
		# raise params.inspect
		if @farm.save
			redirect_to farm_path(@farm)
		else
			redirect_to farms_path
		end
	end


	private

	def farm_params
		params.require(:farm).permit(
			:name, 
			:user_id, 
			:areas_attributes => [
				:id,
				:name, 
				:area_type,
				:capacity, 
				:quantity,
				:farm_id
			]
		)
	end
end